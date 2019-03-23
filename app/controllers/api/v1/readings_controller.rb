module Api
  module V1
    class ReadingsController < ApplicationController
      def create
        @reading = @thermostat.readings.create!(reading_params)
        json_response(@reading, :created)
      end

      private

      def reading_params
        params.permit(:temperature, :number, :humidity, :battery_charge, :thermostat_id)
      end
    end
  end
end