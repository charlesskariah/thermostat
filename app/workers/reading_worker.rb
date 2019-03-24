class ReadingWorker
  include Sidekiq::Worker

  def perform(key)
    thermostat_id = (key.split(":").first)
    reading_params = JSON.parse($redis.get(key))
    Thermostat.find(thermostat_id).readings.create!(reading_params)
    puts "Record created succesfully for #{key}"
  end
end

