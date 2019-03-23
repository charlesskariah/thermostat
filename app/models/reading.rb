class Reading < ApplicationRecord
  belongs_to :thermostat, dependent: :destroy

  auto_increment :number, scope: [:thermostat_id], initial: 1, force: true, lock: false, before: :validation

  validates :number, :temperature, :humidity, :battery_charge, presence: true

  def to_param
    self.number.to_s
  end
end
