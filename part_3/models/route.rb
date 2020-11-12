# frozen_string_literal: true

class Route
  attr_reader :stations

  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station)
    stations.insert(-2, station)
    puts "To route #{name} added station #{station.name}"
  end

  def remove_station(station)
    if [stations.first, stations.last].include?(station)
      raise 'The first and last stations on the route must not be deleted!'
    end

    stations.delete(station)
    puts "From route #{name} deleted station #{station.name}"
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def show_stations
    puts "В маршрут #{name} stations are included:"
    stations.each { |station| puts " #{station.name}" }
  end

  def name
    "#{stations.first.name} - #{stations.last.name}"
  end
end
