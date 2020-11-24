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

describe Train do
  let(:train) { PassengerTrain.new('111-11') }
  let(:station) { Station.new('Kharkiv') }
  let(:carriage) { Carriage.new }
  let(:number) { '111-11' }

  it 'add carriage' do
    expect { train.add_carriage(carriage) }.to change { train.carriages.count }.by(1)
  end

  it 'remove carriage' do
    train.add_carriage(carriage)
    expect { train.remove_carriage(carriage) }.to change { train.carriages.count }.by(-1)
  end

  it 'find train' do
    expect { train.find('111-11') }
  end

  # it 'go to station' do
  #   expect{ station }.to eq('Kharkiv')
  # end
end

describe Station do
  let(:station) { Station.new('Kharkiv') }
  let(:train) { PassengerTrain.new('111-11') }

  it 'got a train' do
    expect { station.get_train(train) }.to change { station.trains.count }.by(1)
  end

  it 'detect names' do
    expect(station.name_detect('Kharkiv').name).to eq('Kharkiv')
  end

  it 'send a train' do
    station.get_train(train)
    expect(station.trains.delete(train))
  end
end

describe Route do
  let(:route) { Route.new('Kharkiv', 'Kiyv') }
  let(:station) { Station.new('Poltava') }

  it 'add station' do
    expect { route.stations.insert(-2, station) }.to change { route.stations.count }.by(1)
  end

  it 'remove station' do
    route.stations.insert(-2, station)
    expect { route.stations.delete(station) }.to change { route.stations.count }.by(-1)
  end
end

describe CarriageAddon do
  let(:train) { PassengerTrain.new('111-11') }
  let(:type_passenger) { 'passenger' }
  let(:type_cargo) { 'cargo' }
  let(:carriage) { Carriage.new }
  let(:size) { 12 }
  let(:carriage_addon) { CarriageAddon.new }

  context 'connect carriage' do
    it 'to passenger train' do
      expect { train.add_carriage(PassengerCarriage.new(size)) }.to change { train.carriages.count }.by(1)
    end

    it 'to cargo train' do
      expect { train.add_carriage(CargoCarriage.new(size)) }.to change { train.carriages.count }.by(1)
    end
  end

  it 'find train number' do
    expect { train.find(number) }
  end

  context 'got size of' do
    it 'passenger carriage' do
      expect(carriage_addon.carriage_size(type_passenger)).to eq(0)
    end

    it 'cargo carriage' do
      expect(carriage_addon.carriage_size(type_cargo)).to eq(0)
    end
  end
end
