require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter:  'postgresql',
  host:     'localhost',
  database: 'murder_api_test',
  username: 'bryce',
  password: ''
)
