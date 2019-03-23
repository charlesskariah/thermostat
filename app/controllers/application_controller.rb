class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :find_household
  attr_reader :thermostat

  private

  def find_household
    @thermostat = Thermostat.where(household_token: request.headers['HouseholdToken']).first
    json_response({ message: 'Not Authorized' }, :unauthorized) unless @thermostat.present?
  end
end
