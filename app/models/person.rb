class Person < ActiveRecord::Base
  has_many :districts
  has_many :zipcodes, :through => :districts
  has_many :contacts
end
