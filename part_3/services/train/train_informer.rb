# frozen_string_literal: true

class TrainInformer < SimpleDelegator
  def print_previous_station
    return if first_station?

    puts "Previous station - #{previous_station.name}."
  end

  def print_next_station
    return if last_station?

    puts "Next - #{next_station.name}."
  end

  def print_current_station
    puts "Now the train is at the station #{current_station.name}."
  end
end
