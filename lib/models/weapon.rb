require 'active_record'

class Weapon < ActiveRecord::Base
  validates :name, :kind, presence: true
  has_many :victims
end
