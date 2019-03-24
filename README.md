# README

## How to start

```
$ git clone git@github.com:charlesskariah/thermostat.git

$ cd thermostat

$ bundle install

$ rake db:create

$ rake db:migrate

$ rake db:seed

$ rails s

$ bundle exec sidekiq

$ rspec

Note : Make sure that you have redis started in the local environment or change config accordingly in config/redis.rb
```

## Api documentation

1. Create reading
``` 
URL - https://apithermostat.herokuapp.com/api/v1/readings

TYPE - POST

HEADER - {"HouseholdToken" => "768gadgadas" }

PARAMS - {
            "temperature" : "2.5",
            "humidity" : "11",
            "battery_charge" : "77"
            
         }

RESPONSE - {
                "reading_id": 1
           }
```

2. Get reading

```
URL - https://apithermostat.herokuapp.com/api/v1/readings/{reading_id}

TYPE - GET

HEADER - {"HouseholdToken" => "768gadgadas" }

RESPONSE - {
    "data": {
        "id": "9",
        "type": "reading",
        "attributes": {
            "number": 7,
            "temperature": 2.5,
            "humidity": 11,
            "battery_charge": 77
        }
    }
}
```

3. Statistics
```
URL - https://apithermostat.herokuapp.com/api/v1/readings/statistics

TYPE - GET

HEADER - {"HouseholdToken" => "768gadgadas" }

RESPONSE - {
    "temperature": [
        {
            "minimum": 2.5
        },
        {
            "maximum": 77.5
        },
        {
            "average": 69
        }
    ],
    "humidity": [
        {
            "minimum": 11
        },
        {
            "maximum": 101
        },
        {
            "average": 91
        }
    ],
    "battery_charge": [
        {
            "minimum": 77
        },
        {
            "maximum": 780
        },
        {
            "average": 701
        }
    ]
}
```