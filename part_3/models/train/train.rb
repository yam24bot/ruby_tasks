# frozen_string_literal: true

class Train
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :speed, :number, :carriages, :route
  attr_reader :type, :informer, :safety
  attr_writer :trains, :current_station

  @trains = {}
  TRAIN_NUMBER = /^[a-z0-9]{3}-?[a-z0-9]{2}$/i.freeze

  def initialize(number, type)
    @number = number
    @type = type
    @carriages = []
    validate!
    Train.all[number] = self
    @informer = TrainInformer.new(self)
    @safety = TrainSafety.new(self)
    register_instance
  end

  class << self
    def find(number)
      @trains[number]
    end

    def all
      @trains
    end
  end

  def add_carriage(carriage)
    carriages << carriage
    puts "To the train #{number} hitched a carriage."
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}"
  end

  def remove_carriage(carriage)
    safety.check_carriage_presence(carriage)

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
    safety.check_route_presence
    safety.check_destination(station)
    safety.check_destination_presence(station)
    current_station.send_train(self)
    self.current_station = station
    current_station.get_train(self)
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def stations_around
    raise 'Route not set' if route.nil?

    safety.check_route_presence
    informer.print_current_station
    informer.print_previous_station
    informer.print_next_station
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def iterate_carriages(&arg)
    if !block_given?
      @carriages.each(&arg)
    else
      @carriages.to_enum(&arg)
    end
  end

  def current_station
    @current_station ||= NullStation.new
  end

  def last_station?
    route.last_station?(current_station)
  end

  def previous_station
    route.previous_station(current_station_index)
  end

  def next_station
    route.next_station(current_station_index)
  end

  def first_station?
    current_station_index.zero?
  end

  private

  def current_station_index
    route.station_index(current_station)
  end
end
