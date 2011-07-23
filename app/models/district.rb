class District < ActiveRecord::Base
  belongs_to :person
  belongs_to :zipcode
end
