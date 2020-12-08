# frozen_string_literal: true

require_relative '../main'

describe Station do
  let(:station) { described_class.new('Kharkiv') }
  let(:train) { PassengerTrain.new('111-11') }

  it 'got a train' do
    expect { station.get_train(train) }.to change { station.trains.count }.by(1)
  end

  it 'detect names' do
    expect(station.name_detect('Kharkiv').name).to eq('Kharkiv')
  end

  it 'send a train' do
    station.get_train(train)
    expect(station.trains.delete(train))
  end
end
