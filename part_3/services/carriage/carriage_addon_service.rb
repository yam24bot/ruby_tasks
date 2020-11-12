# frozen_string_literal: true

class CarriageAddon
  def self.add
    raise 'First you need to create a train' if Train.all.empty?

    puts 'To which? (enter number)'
    number = gets.chomp
    train = Train.find(number)
    raise 'There is no train with this number' if train.nil?

    train_type(train.type)

    train.add_carriage(CARRIAGE_TYPES[train.type].new(@size))
  rescue RuntimeError => e
    puts "Error: #{e.message}"
    retry unless Train.all.empty?
  end

  def self.train_type(type)
    case type
    when 'passenger'
      puts 'Enter the number of seats in the car'
      @size = gets.chomp.to_i
    when 'cargo'
      puts 'Enter the volume of the car'
      @size = gets.chomp.to_f
    end
  end
end
