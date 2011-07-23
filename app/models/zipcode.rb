class Zipcode < ActiveRecord::Base
  has_many :districts
  has_many :people, :through => :districts
end
