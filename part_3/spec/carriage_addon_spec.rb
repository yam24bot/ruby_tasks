require_relative '../main'

describe CarriageAddon do
    let(:train) { PassengerTrain.new('111-11') }
    let(:type_passenger) { 'passenger' }
    let(:type_cargo) { 'cargo' }
    let(:carriage) { Carriage.new }
    let(:size) { 12 }
    let(:carriage_addon) { CarriageAddon.new }
  
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
  
    context 'got size of' do
      it 'passenger carriage' do
        pry
        expect(carriage_addon.carriage_size(type_passenger)).to eq(0)
      end
  
      it 'cargo carriage' do
        expect(carriage_addon.carriage_size(type_cargo)).to eq(0)
      end
    end
  end
  