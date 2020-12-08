# frozen_string_literal: true

require_relative '../main'

describe CarriageAddon do
  let(:train) { PassengerTrain.new('111-11') }
  let(:type_passenger) { 'passenger' }
  let(:type_cargo) { 'cargo' }
  let(:carriage) { Carriage.new }
  let(:size) { 12 }
  let(:carriage_addon) { described_class.new }

  context 'connect carriage' do
    it 'to passenger train' do
      expect { train.add_carriage(PassengerCarriage.new(size)) }.to change { train.carriages.count }.by(1)
    end

    it 'to cargo train' do
      expect { train.add_carriage(CargoCarriage.new(size)) }.to change { train.carriages.count }.by(1)
    end
  end

  it 'find train number' do
    expect { train.find(number) }
  end
end
