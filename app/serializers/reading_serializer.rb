class ReadingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :number, :temperature, :humidity, :battery_charge
end
