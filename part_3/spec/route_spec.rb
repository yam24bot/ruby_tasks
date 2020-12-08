# frozen_string_literal: true

require_relative '../main'

describe Route do
  let(:route) { described_class.new('Kharkiv', 'Kiyv', 'Kharkiv-Kyiv') }
  let(:station) { Station.new('Poltava', 1) }

  it 'add station' do
    expect { route.stations.insert(-2, station) }.to change { route.stations.count }.by(1)
  end

  it 'remove station' do
    route.stations.insert(-2, station)
    expect { route.stations.delete(station) }.to change { route.stations.count }.by(-1)
  end
end
