# frozen_string_literal: true

require_relative '../main'
describe Train do
  let(:train) { PassengerTrain.new('111-11') }
  let(:station) { Station.new('Kharkiv') }
  let(:carriage) { Carriage.new }
  let(:number) { '111-11' }

  it 'add carriage' do
    expect { train.add_carriage(carriage) }.to change { train.carriages.count }.by(1)
  end

  it 'remove carriage' do
    train.add_carriage(carriage)
    expect { train.remove_carriage(carriage) }.to change { train.carriages.count }.by(-1)
  end

  it 'find train number' do
    train
    expect(described_class.find('111-11')).to eq(train)
  end
end
