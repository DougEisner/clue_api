require 'rack/test'
require 'api'
require 'pry'

describe 'api' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before :all do
    weapon = Weapon.create(name: 'Horse-Dagger', kind: 'melee')
    weapon2 = Weapon.create(name: 'Ax', kind: 'melee')
    victim = Victim.create(name: 'Grover', weapon: weapon2)
    victim2 = Victim.create(name: 'Ernie', weapon: weapon)
  end

  describe '#get /api/victims' do
    it 'returns all victims' do
      get '/api/victims'

      # binding.pry
      expect(JSON.parse(last_response.body).first['name']).to eq 'Ernie'
    end
  end

  describe '#get /api/victims/:id' do
    context 'when a valid victim id is entered' do
      it 'return a victim' do
        get '/api/victims/1'

        # binding.pry
        expect(JSON.parse(last_response.body)['name']).to eq 'Grover'
      end
    end

    context 'when an invalid victim id is entered' do
      it 'returns a not found status 404' do
        get '/api/victims/999'

        # binding.pry
        expect(last_response.status).to eq 404
      end
    end
  end

  describe '# get /api/victims?sort' do
    context 'when a sort field is entered' do
      it 'returns all victims sorted by field' do
        get '/api/victims?sort=weapon_id'

        # binding.pry
        expect(JSON.parse(last_response.body).first['name']).to eq 'Ernie'
      end
    end
  end

  describe '#post /api/victims' do
    context 'creating valid victim' do
      it 'creates new victim' do
        post '/api/victims?name=Carl&weapon_id=2'

        # binding.pry
        expect(JSON.parse(last_response.body)['name']).to eq 'Carl'
      end
    end
  end

  describe '#patch /api/victims/:id/:name' do
    context 'give valid id and new name' do
      it 'updates just the name' do
        patch '/api/victims/1/jeff'

        expect(JSON.parse(last_response.body)['name']).to eq 'jeff'
      end
    end
  end

  describe '#delete /api/victims/:id' do
    context 'give valid id' do
      it 'deletes that victim' do
        delete '/api/victims/1'

        expect(Victim.find_by_id(1)).to eq nil
      end
    end
  end
end
