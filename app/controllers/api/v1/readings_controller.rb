module Api
  module V1
    class ReadingsController < ApplicationController
      def create
        @reading = @thermostat.readings.create!(reading_params)
        json_response({reading_id: @reading.number}, :created)
      end

      def show
        @reading = @thermostat.readings.find_by!(number: params[:id])
        json_response(serializer.new(@reading), :ok)
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

      def serializer
        ReadingSerializer
      end
    end
  end
end