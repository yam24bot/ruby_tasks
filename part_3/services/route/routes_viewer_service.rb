# frozen_string_literal: true

class RoutesViewer
  class << self
    # attr_reader :train
    def check
      check_routes

      all_routes
    rescue RuntimeError => e
      puts "Error: #{e.message}"
    end

    private

    def check_routes
      if Route.all.count == 0
        raise "There is no route. Please, add new route to see routes in this row"
      end
    end
    
    def all_routes
      Route.all.each do |name, value|
        puts "===\nRoute named #{name}\n==="
        puts "Stations:\n-----"
        value.stations.each do |station|
          puts station.name
        end
        puts "-----"
      end
    end
  end
end
