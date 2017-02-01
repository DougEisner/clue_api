require 'active_record'

class Victim < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :weapon
end
