# ToyRobotSimulator

This application simulates a toy robot moving on a square board. There are no obstacles on the board, but it prevents the robot from falling off of it.

## Environment

This application was developed and tested on
> OS X Yosemite with ruby 2.2.0
## Installation
Clone this repo and then execute:

    $ bundle install

Application is ready to go!
## Usage

Just run

    $ ./bin/console

from the main folder. You can now move with your robot using below commands:
* PLACE X,Y,DIR
* MOVE
* LEFT
* RIGHT
* REPORT
* EXIT

You can also pass a text file to the ```/bin/console``` script with commands in separate lines like below:

    $ ./bin/console < commands.txt
Where ```commands.txt``` can look as below:
```ruby
PLACE 1,1,NORTH
MOVE
RIGHT
MOVE
REPORT
EXIT
```

## Testing
To execute unit tests just run ```rake rspec``` in the main directory.

You can also run integration tests from ``spec`` folder like below:

    $ ./bin/console < spec/test_1.txt

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krzyho/toy_robot_simulator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

