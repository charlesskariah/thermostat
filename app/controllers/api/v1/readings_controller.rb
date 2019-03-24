module Api
  module V1
    class ReadingsController < ApplicationController
      before_action :generate_number, only: [:create]

      def create
        reading = reading_params.merge(number: @number)
        key = @thermostat.id.to_s + ':' + @number.to_s
        $redis.set(key, reading.to_json)
        ReadingWorker.perform_async(key)
        json_response({reading_id: @number}, :created)
      end

      def show
        key = @thermostat.id.to_s + ':' + params[:id].to_s
        if $redis.get(key).present?
          json_response(JSON.parse($redis.get(key)), :ok)
        else
          @reading = @thermostat.readings.find_by!(number: params[:id])
          json_response(serializer.new(@reading), :ok)
        end
      end

      def statistics
        keys = [:temperature, :humidity, :battery_charge]
        result = Hash.new { |h,k| h[k] = [ ] }
        @readings = Reading.where(thermostat_id: @thermostat.id)
        keys.each do |key|
          result[key] << {minimum: @readings.minimum(key)}
          result[key] << {maximum: @readings.maximum(key)}
          result[key] << {average: @readings.average(key).to_i}
        end
        json_response(result, :ok)
      end

      private

      def reading_params
        params.permit(:temperature, :number, :humidity, :battery_charge, :thermostat_id)
      end

      def generate_number
        previous_reading = @thermostat.try(:readings).order(number: :desc).first.try(:number)
        @number = previous_reading ? previous_reading + 1 : 1
      end

      def serializer
        ReadingSerializer
      end
    end
  end
end