# frozen_string_literal: true

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :speed, :number, :carriages, :route, :station
  attr_reader :type
  attr_writer :trains

  @@trains = {}
  TRAIN_NUMBER = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    @speed = 0
    validate!
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number]
  end

  def self.all
    @@trains
  end

  def stop
    self.speed = 0
  end

  def add_carriage(carriage)
    raise 'Do not hitch wagons on the move!' unless speed.zero?

    carriages << carriage
    puts "To the train #{number} hitched a carriage."
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
  end

  def remove_carriage(carriage)
    raise 'Carriages must not be uncoupled on the move!' unless speed.zero?
    raise 'There is no such carriage on this train' unless carriages.include?(carriage)

    carriages.delete(carriage)
    puts "From the train #{number} uncoupled the carriage."
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def take_route(route)
    self.route = route
    puts "Train #{number} route set #{route.name}"
  end

  def go_to(station)
    raise 'Route not established' if route.nil?
    raise "Train #{@number} already on station #{@station.name}" if @station == station
    raise "Station #{station.name} not included in the train #{number} route" unless route.stations.include?(station)

    @station&.send_train(self)
    @station = station
    station.get_train(self)
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def stations_around
    raise 'Route not set' if route.nil?

    station_index = route.stations.index(station)
    puts "Now the train is at the station #{station.name}."
    puts "Previous station - #{route.stations[station_index - 1].name}." if station_index_zero_check(station_index)
    if station_index_route_size(station_index, route.station.size)
      puts "Next - #{route.stations[station_index + 1].name}."
    end
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def iterate_carriages(&block)
    raise 'There are no carriages attached to the train' if @carriages.empty?

    @carriages.each(&block)
  end

  def station_index_zero_check(station_index)
    station_index
  end

  def station_index_route_size(station_index, size)
    station_index != size - 1
  end
end
