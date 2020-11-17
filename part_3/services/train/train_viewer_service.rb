# frozen_string_literal: true

class TrainViewer
  class << self
    def list
      raise 'First you need to create a station' if Station.all.empty?

      find_by_name

      raise 'There is no such station' if station.nil?

      @station.iterate_trains { |train| puts "№#{train.number} #{train.type} wagons #{train.carriages.count}" }
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    def find_by_name
      puts 'Which one? (name)'
      name = gets.chomp
      @station = Station.all.detect { |station_detect| station_detect.name == name }
    end
  end
end
