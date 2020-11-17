require_relative 'modules/instance_counter'
require_relative 'modules/validation'
require_relative 'modules/manufacturer'
require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/train/train'
require_relative 'models/carriage/carriage'
require_relative 'models/train/cargo_train'
require_relative 'models/carriage/cargo_carriage'
require_relative 'models/train/passenger_train'
require_relative 'models/carriage/passenger_carriage'

CARRIAGE_TYPES = { 'cargo' => CargoCarriage, 'passenger' => PassengerCarriage }.  

def create_station
  puts 'What is the name?'
  name = gets.chomp
  Station.new(name)
  puts "Построена станция #{name}"
rescue RuntimeError => e
  puts "Ошибка: #{e.message}"
  retry
end

def create_train
  puts 'What number?'
  number = gets.chomp
  raise "Train #{number} already exists" unless Train.find(number).nil?

  puts '1 - passenger, 2 - cargo'
  choice = gets.chomp.to_i
  raise 'The train is not created. Should have entered 1 or 2' unless [1, 2].include?(choice)

  case choice
  when 1
    PassengerTrain.new(number)
    puts "Passenger train created #{number}"
  when 2
    CargoTrain.new(number)
    puts "Freight train created #{number}"
  end
rescue RuntimeError => e
  puts "Error: #{e.message}"
  retry
end

def add_carriage
  raise 'First you need to create a train' if Train.all.empty?
  puts 'To which? (enter number)'
  number = gets.chomp
  train = Train.find(number)
  raise 'There is no train with this number' if train.nil?
  if train.type == 'passenger'
    puts 'Enter the number of seats in the car'
    size = gets.chomp.to_f
  elsif train.type == 'cargo'
    puts 'Enter the volume of the car'
    size = gets.chomp.to_i
  end
  train.add_carriage(CARRIAGE_TYPES[train.type].new(size))
rescue RuntimeError => e
  puts "Error: #{e.message}"
  retry unless Train.all.empty?
end

def remove_carriage
  raise 'First you need to create a train' if Train.all.empty?
  puts 'From what? (enter number)'
  number = gets.chomp
  train = Train.find(number)
  raise 'There is no train with this number' if train.nil?
  raise 'This train already has no wagons' if train.carriages.empty?
  train.remove_carriage(train.carriages.last)
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

def train_to_station
  raise 'First you need to create a train' if Train.all.empty?
  raise 'First you need to create a station' if Station.all.empty?
  puts 'Which train? (enter number)'
  number = gets.chomp
  train = Train.find(number)
  raise 'There is no train with this number' if train.nil?
  puts 'Which station? (name)'
  name = gets.chomp
  station = Station.all.detect { |stn| stn.name == name }
  raise 'There is no such station' if station.nil?
  station.get_train(train)
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

def stations_list
  raise 'No stations created yet' if Station.instances.nil?
  puts 'List of stations:'
  Station.all.each { |stn| puts stn.name }
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

def trains_list
  raise 'First you need to create a station' if Station.all.empty?
  puts 'Which one? (name)'
  name = gets.chomp
  station = Station.all.detect { |station| station.name == name }
  raise 'There is no such station' if station.nil?
  station.iterate_trains { |train| puts "№#{train.number} #{train.type} wagons #{train.carriages.count}" }
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

def carriages_list
  raise 'First you need to create a train' if Train.all.empty?
  puts 'Enter train number'
  number = gets.chomp
  train = Train.find(number)
  raise 'There is no train with this number' if train.nil?
  carriage_number = 0
  train.iterate_carriages { |carriage| puts "№#{carriage_number += 1} #{train.type} free #{carriage.free}, busy #{carriage.filled}" }
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

def load_carriage
  raise 'First you need to create a train' if Train.all.empty?
  puts 'Enter train number'
  number = gets.chomp
  train = Train.find(number)
  raise 'There is no train with this number' if train.nil?
  puts 'Enter the carriage number'
  carriage_number = gets.chomp.to_i
  raise 'There is no such carriage on the train' if carriage_number > train.cariages.size
  if train.type == 'cargo'
    puts 'Enter cargo volume '
    train.carriages[carriage_number - 1].load(gets.chomp.to_f)
  elsif train.type == 'passenger'
    train.carriages[carriage_number - 1].take_a_seat
  end
  puts 'Complete'
rescue RuntimeError => e
  puts "Error: #{e.message}"
end

puts %(
  0. Exit
  1. Create station
  2. Create a train
  3. Attach the carriage to the train
  4. Disconnect the car from the train
  5. Place the train at the station
  6. View station list
  7. View the list of trains at the station
  8. View the list of wagons by the train
  9. Take a place / volume in the car
)

loop do
  print 'Enter the command number: '
  choice = gets.chomp.to_i

  case choice
  when 0
    puts 'See you later!'
    break
  when 1
    create_station
  when 2
    create_train
  when 3
    add_carriage
  when 4
    remove_carriage
  when 5
    train_to_station
  when 6
    stations_list
  when 7
    trains_list
  when 8
    carriages_list
  when 9
    load_carriage
  else
    puts 'You must choose one of the proposed options'
  end
end
