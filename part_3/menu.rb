# frozen_string_literal: true

class MainMenu
  def self.list
    puts %(
    0. Exit
    1. Create station
    2. Create a train
    3. Attach the carriage to the train
    4. Disconnect the car from the train
    5. Place the train at the station
    6. View station list
    7. View the list of trains at the station
    8. View the list of wagons by the train
    9. Take a place / volume in the car
    10. Create new route
    'Enter the command number: '
    )

    loop do
      choice = gets.chomp.to_i
      case choice
      when 0
        break
      when 1
        StationBuilder.create
      when 2
        TrainBuilder.create
      when 3
        CarriageAddon.add
      when 4
        CarriageDestroyer.destroy
      when 5
        TrainMover.move
      when 6
        StationViewer.list
      when 7
        TrainViewer.list
      when 8
        CarriageViewer.list
      when 9
        CarriageLoader.load
      when 10
        RouteBuilder.create
      when 11
        RouteAddon.add
      when 12
        RoutesViewer.check
      when 13
        pry
      else
        puts 'You must choose one of the proposed options'
      end
    end
  end
end
