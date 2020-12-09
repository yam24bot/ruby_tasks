# frozen_string_literal: true

class RouteAddon
  class << self
    attr_reader :station, :route
    def add
      route_name

      enter_station_name

      add_station
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def route_name
      puts 'Enter route name'
      name = gets.chomp
      @route = Route.find(name)
    end

    def enter_station_name
      puts 'Enter station name'
      name = gets.chomp
      @station = Station.find(name)
    end

    def add_station
      route.add_station(station)
    end
  end
end
