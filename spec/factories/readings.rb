FactoryBot.define do
  factory :reading do
    thermostat_id { 1 }
    number { 1 }
    temperature { 1.5 }
    humidity { 1.5 }
    batter_charge { 1.5 }
  end
end