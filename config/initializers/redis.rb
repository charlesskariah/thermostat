uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
$redis = Redis::Namespace.new("thermostat_api", :redis => Redis.new(:url => uri))