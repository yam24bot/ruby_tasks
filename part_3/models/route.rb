# frozen_string_literal: true

class Route
  include Manufacturer
  include InstanceCounter
  include Validation

  attr_accessor :stations

  @routes = {}

  def initialize(from, to, name)
    @name = name
    @stations = [from, to]
    Route.all[name] = self
    register_instance
  end

  class << self
    def find(number)
      @routes[number]
    end

    def all
      @routes
    end
  end

  # route = Route.new("Kyiv","Kharkiv", "Kyiv-Kharkiv")
  # station = Station.new("Poltava")

  def add_station(station)
    stations.insert(-2, station)
    puts "To route #{@name} added station #{station.name}"
  end

  def remove_station(station)
    if [stations.first, stations.last].include?(station)
      raise 'The first and last stations on the route must not be deleted!'
    end

    stations.delete(station)
    puts "From route #{@name} deleted station #{station.name}"
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def show_stations
    puts "В маршрут #{@name} stations are included:"
    stations.each { |station| puts " #{station.name}" }
  end

  def name
    "#{stations.first.name} - #{stations.last.name}"
  end

  def previous_station(index)
    stations[index - 1]
  end

  def next_station(index)
    stations[index + 1]
  end

  def last_station?(station)
    station == stations.last
  end

  def station_index(station)
    stations.index(station)
  end
end
