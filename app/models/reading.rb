class Reading < ApplicationRecord
  belongs_to :thermostat, dependent: :destroy

  validates :number, :temperature, :humidity, :battery_charge, presence: true
  
  after_save :remove_from_redis_store

  def to_param
    self.number.to_s
  end

  private

  def remove_from_redis_store
    key = self.thermostat_id.to_s + ':' + self.number.to_s
    $redis.del(key)
  end
end
