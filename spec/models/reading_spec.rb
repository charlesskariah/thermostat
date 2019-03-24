require 'rails_helper'

RSpec.describe Reading, type: :model do
  let!(:reading) { create(:reading) }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(reading).to be_valid
    end

    it "is not valid without a thermostat_id" do
      reading.thermostat_id = nil
      expect(reading).to_not be_valid
    end

    it "is not valid without a number" do
      reading.number = nil
      expect(reading).to_not be_valid
    end

  end
end