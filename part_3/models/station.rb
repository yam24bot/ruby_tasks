# frozen_string_literal: true

class Station
  include InstanceCounter
  include Validation
  @stations = []
  attr_reader :name

  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    validate!
    self.class.all << self
    register_instance
  end

  def self.all
    @stations
  end

  def self.name_detect(name)
    return Station.all.detect { |station_detect| station_detect.name == name }
  end
  def get_train(train)
    raise "Train #{train.number} already on station #{name}" if @trains.include?(train)

    @trains << train
    puts "On station #{name} train #{train.number} arrived"
  end

  def send_train(train)
    @trains.delete(train)
    train.station = nil
    puts "From station #{name} train departed #{train.number}"
  end

  def iterate_trains(&block)
    raise 'There are no trains at the station' if @trains.empty?

    @trains.each(&block)
  end
end
