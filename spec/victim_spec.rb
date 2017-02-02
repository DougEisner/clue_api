require 'models/victim'
require 'test_environment'

describe Victim do
  before :all do
    victim = Victim.find_by_id(1)
    victim.destroy
    victim2 = Victim.find_by_id(2)
    victim2.destroy
    weapon = Weapon.find_by_id(1)
    weapon.destroy
    weapon2 = Weapon.find_by_id(2)
    weapon2.destroy
  end
  
  describe '#valid?' do
    context 'when given a name' do
      it 'returns true' do
        victim = Victim.new(name: 'Bert')

        expect(victim.valid?).to eq true
      end
    end

    context 'when not given a name' do
      it 'returns false' do
        victim = Victim.new

        expect(victim.valid?).to eq false
      end
    end
  end

  describe '#create' do
    it 'returns a Victim object with an id and a weapon' do
      weapon = Weapon.create(name: 'Horse-Dagger', kind: 'melee')
      victim = Victim.create(name: 'Bert', weapon: weapon)

      expect(victim.id > 0).to eq true
      expect(victim.weapon.id).to eq weapon.id
      expect(victim.weapon.name).to eq 'Horse-Dagger'
    end
  end
end
