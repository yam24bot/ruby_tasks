# frozen_string_literal: true

class CarriageLoader
  def self.load
    raise 'First you need to create a train' if Train.all.empty?

    enter_train_number
    raise 'There is no train with this number' if @train.nil?

    enter_carriage_number
    raise 'There is no such carriage on the train' if @carriage_number > @train.cariages.size

    enter_volume(@train.type)
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def self.enter_volume
    case type
    when 'cargo'
      puts 'Enter cargo volume '
      @train.carriages[@carriage_number - 1].load(gets.chomp.to_f)
    when 'passenger'
      @train.carriages[@carriage_number - 1].take_a_seat
    end
    puts 'Complete'
  end

  def self.enter_carriage_number
    puts 'Enter the carriage number'
    @carriage_number = gets.chomp.to_i
  end

  def self.enter_train_number
    puts 'Enter train number'
    number = gets.chomp
    @train = Train.find(number)
  end
end
