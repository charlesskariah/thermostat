require 'rails_helper'

RSpec.describe Thermostat, type: :model do
  let!(:thermostat) { create(:thermostat) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(thermostat).to be_valid
    end

    it "is not valid without a household_token" do
      thermostat.household_token = nil
      expect(thermostat).to_not be_valid
    end

    it "is not valid without a location" do
      thermostat.location = nil
      expect(thermostat).to_not be_valid
    end
  end
end
