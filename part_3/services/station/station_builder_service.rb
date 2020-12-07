# frozen_string_literal: true

class StationBuilder
  def self.create
    puts 'What is the name of station?'
    name = gets.chomp
    puts 'What is the number of station?'
    number = gets.chomp.to_i
    Station.new(name, number)
    puts "Построена станция #{name}"
  end
end
