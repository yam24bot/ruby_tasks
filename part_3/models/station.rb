class Station
  include InstanceCounter
  include Validation
  @@stations = []
  attr_reader :name
  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
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

  def iterate_trains
    raise 'There are no trains at the station' if @trains.empty?
    @trains.each { |train| yield(train) }
  end

end
