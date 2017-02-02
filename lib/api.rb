require 'pry'
require 'sinatra'
require_relative 'test_environment'
require_relative 'models/victim'

get '/api/victims' do
  sort = params['sort'] || 'name'
  Victim.order(sort).to_json
end

get '/api/victims/:id' do |id|
  victim = Victim.find_by_id(id)
  if victim.nil?
    status 404
  else
    victim.to_json
  end
end

post '/api/victims' do
  victim = Victim.create(name: params[:name], weapon_id: params[:weapon_id]).to_json
end

patch '/api/victims/:id/:name' do |id, name|
  victim = Victim.find_by_id(id)
  if victim.nil?
    halt 404
  end
  victim.update(name: name)
  victim.to_json
end

delete '/api/victims/:id' do |id|
  victim = Victim.find_by_id(id)
  victim.destroy
end
