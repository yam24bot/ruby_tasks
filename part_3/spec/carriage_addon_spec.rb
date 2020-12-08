# frozen_string_literal: true

require_relative '../main'

describe CarriageAddon do
  let(:train) { PassengerTrain.new('111-11') }
  let(:carriage_addon) { described_class.new }

  context 'when carriage connect' do
    it 'to passenger train' do
      expect { train.add_carriage(PassengerCarriage.new(12)) }.to change { train.carriages.count }.by(1)
    end

    it 'to cargo train' do
      expect { train.add_carriage(CargoCarriage.new(12)) }.to change { train.carriages.count }.by(1)
    end
  end

  it 'find train by number' do
    train
    expect(Train.find('111-11')).to eq(train)
  end
end
