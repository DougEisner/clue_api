require 'rspec'
require 'pry'
require 'models/weapon'
require 'test_environment'

describe Weapon do
  # before :all do
  #   victim = Victim.find_by_id(1)
  #   victim.destroy
  #   victim2 = Victim.find_by_id(2)
  #   victim2.destroy
  #   weapon = Weapon.find_by_id(1)
  #   weapon.destroy
  #   weapon2 = Weapon.find_by_id(2)
  #   weapon2.destroy
  # end

  describe '#valid?' do
    context 'when a weapon has a name and a kind' do
      it 'returns true' do
        weapon = Weapon.new(name: 'Horse-Dagger', kind: 'melee')

        expect(weapon.valid?).to eq true
      end
    end

    context 'when a weapon does have a name but does not have a kind' do
      it 'returns false' do
        weapon = Weapon.new(name: 'Horse-Dagger', kind: '')

        expect(weapon.valid?).to eq false
      end
    end

    context 'when a weapon does not have a name but does have a kind' do
      it 'returns false' do
        weapon = Weapon.new(name: '', kind: 'melee')

        expect(weapon.valid?).to eq false
      end
    end
  end

  describe '#create' do
    it 'returns a Weapon object with an id' do
      weapon = Weapon.create(name: 'Horse-Dagger', kind: 'melee')

      expect(weapon.id > 0).to eq true
    end
  end

  describe '#victims' do
    it 'returns victims' do
      weapon = Weapon.create(name: 'Hammer', kind: 'tool')
      Victim.create(name: 'Bert', weapon: weapon)
      Victim.create(name: 'Bruce', weapon: weapon)

      expect(weapon.victims.length).to eq 2
      # binding.pry
      expect(weapon.victims.last.name).to eq 'Bert'
      expect(weapon.victims.first.name).to eq 'Bruce'
    end
  end
end
