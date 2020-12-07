# frozen_string_literal: true

class RouteBuilder
  def self.create
    puts 'Enter number of first station'
    first_station_number = gets.chomp.to_i
    first_station = Station.find(first_station_number)
    puts 'Enter number of last station'
    last_station_number = gets.chomp.to_i
    last_station = Station.find(first_station_number)
    puts 'Enter name on this route'
    name = gets.chomp.to_s
    Route.new(first_station, last_station, name)
    puts "Created route #{first_station.name}-#{last_station.name} named #{name}"
  end
end
