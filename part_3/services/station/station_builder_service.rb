# frozen_string_literal: true

class StationBuilder
  def self.create
    puts 'What is the name?'
    name = gets.chomp
    Station.new(name)
    puts "Построена станция #{name}"
  end
end
