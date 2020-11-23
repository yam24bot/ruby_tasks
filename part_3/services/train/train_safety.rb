# frozen_string_literal: true

class TrainSafety < SimpleDelegator
  def check_train_speed
    raise 'The train is moving!' if speed.positive?
  end

  def check_carriage_presence(carriage)
    raise 'There is no such carriage on this train' unless carriages.include?(carriage)
  end

  def check_destination_presence(station)
    return if route.stations.include?(station)

    raise "Station #{station.name} not included in the train #{number} route"
  end

  def check_destination(station)
    raise "Train #{number} already on station #{current_station.name}" if current_station == station
  end

  def check_route_presence
    raise 'Route not established' if train.route.nil?
  end

  def check_station
    raise 'First you need to create a station' if Station.all.empty?
  end

  def check_train
    raise 'First you need to create a train' if Train.all.empty?
  end
end
