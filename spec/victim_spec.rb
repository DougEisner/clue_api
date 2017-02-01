require 'models/victim'
require 'test_environment'

describe Victim do
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
