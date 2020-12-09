# frozen_string_literal: true

class StationViewer
  def self.list
    raise 'No stations created yet' if Station.instances.nil?

    puts 'List of stations:'
    Station.all.each { |stn| puts stn.name }
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end
end
