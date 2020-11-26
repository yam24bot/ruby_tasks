# frozen_string_literal: true

class RouteBuiler
  def self.create
    puts 'Enter name of first station'
    first_station_name = gets.chomp
    first_station = Station.find(first_station_name)
    puts 'Enter name of last station'
    last_station_name = gets.chomp
    last_station = Station.find(first_station_name)
    puts 'Enter name on this route'
    Route.new(first_station, last_station, name)
    puts "Created route #{first_station}-#{last_station} named #{name}"
  end
end
