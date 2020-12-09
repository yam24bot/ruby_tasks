# frozen_string_literal: true

class CarriageSafety
  def check_created_train
    raise 'First you need to create a train' if Train.all.empty?
  end

  def check_train_number(train)
    raise 'There is no train with this number' if train.nil?
  end

  def check_wagons(train)
    raise 'This train already has no wagons' if train.carriages.empty?
  end

  def check_carriages_on_train
    raise 'There is no such carriage on the train' if @carriage_number > @train.cariages.size
  end
end
