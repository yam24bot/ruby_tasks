# frozen_string_literal: true

class TrainBuilder
  class << self
    def create
      input_train

      carriage_type

      create_train(@choice)
    rescue RuntimeError => e
      puts "Error: #{e.message}"
      retry
    end

    def carriage_type
      puts '1 - passenger, 2 - cargo'
      @choice = gets.chomp.to_i
      raise 'The train is not created. Should have entered 1 or 2' unless [1, 2].include?(@choice)
    end

    def input_train
      puts 'What number?(in format xxx-xx)'
      @number = gets.chomp
      puts "Train #{@number} already exists" while Train.find(@number)
    end

    def create_train(choice)
      case choice
      when 1
        PassengerTrain.new(@number)
        puts "Passenger train created #{@number}"
      when 2
        CargoTrain.new(@number)
        puts "Freight train created #{@number}"
      end
    end
  end
end
