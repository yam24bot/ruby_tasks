# frozen_string_literal: true

require 'pry'
require 'delegate'
require_relative 'modules/instance_counter'
require_relative 'modules/validation'
require_relative 'modules/manufacturer'
require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/null_station'
require_relative 'models/train/train'
require_relative 'models/carriage/carriage'
require_relative 'models/train/cargo_train'
require_relative 'models/carriage/cargo_carriage'
require_relative 'models/train/passenger_train'
require_relative 'models/carriage/passenger_carriage'
require_relative 'services/station/station_builder_service'
require_relative 'services/station/station_viewer_service'
require_relative 'services/train/train_builder_service'
require_relative 'services/train/train_viewer_service'
require_relative 'services/train/train_mover_service'
require_relative 'services/train/train_informer'
require_relative 'services/train/train_safety'
require_relative 'services/carriage/carriage_addon_service'
require_relative 'services/carriage/carriage_destroyer_service'
require_relative 'services/carriage/carriage_viewer_service'
require_relative 'services/carriage/carriage_loader_service'
require_relative 'services/carriage/carriage_safety'

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

  'Enter the command number: '
  )

loop do
  choice = gets.chomp.to_i
  case choice
  when 0
    break
  when 1
    StationBuilder.create
  when 2
    TrainBuilder.create
  when 3
    CarriageAddon.add
  when 4
    CarriageDestroyer.destroy
  when 5
    TrainMover.move
  when 6
    StationViewer.list
  when 7
    TrainViewer.list
  when 8
    CarriageViewer.list
  when 9
    CarriageLoader.load
  else
    puts 'You must choose one of the proposed options'
  end
end
