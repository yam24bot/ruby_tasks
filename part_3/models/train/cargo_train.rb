class CargoTrain < Train
  validate :number, :presence
  validate :number, :format, TRAIN_NUMBER
  def initialize(number)
    super(number, 'cargo')
  end

  def add_carriage(carriage)
    unless carriage.instance_of?(CargoCarriage)
      raise 'Only freight wagons can be coupled to a freight train'
    end
    super(carriage)
  rescue RuntimeError => e
    puts "Error: #{e.message}"
  end
end
