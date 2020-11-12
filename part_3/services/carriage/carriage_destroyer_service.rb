# frozen_string_literal: true

class CarriageDestroyer
  def self.destroy
    raise 'First you need to create a train' if Train.all.empty?

    puts 'From what? (enter number)'
    number = gets.chomp
    train = Train.find(number)
    raise 'There is no train with this number' if train.nil?
    raise 'This train already has no wagons' if train.carriages.empty?

    train.remove_carriage(train.carriages.last)
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end
end
