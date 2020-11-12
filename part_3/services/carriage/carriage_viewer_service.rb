# frozen_string_literal: true

class CarriageViewer
  def self.list
    raise 'First you need to create a train' if Train.all.empty?

    enter_train_number
    raise 'There is no train with this number' if @train.nil?

    carriage_number = 0
    @train.iterate_carriages do |carriage|
      puts "№#{carriage_number += 1} #{@train.type} free #{carriage.free}, busy #{carriage.filled}"
    end
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end

  def self.enter_train_number
    puts 'Enter train number'
    number = gets.chomp
    @train = Train.find(number)
  end
end
