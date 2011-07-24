# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

mark = Person.create(:first_name => 'Mark', :last_name => 'Leno', :position => 'State Senator', :image_link => 'images/mark_leno.jpg')
tom = Person.create(:first_name => 'Tom', :last_name => 'Ammiano', :position => 'Assemblymember', :image_link => 'images/tom_ammiano.jpg')
barb = Person.create(:first_name => 'Barbara', :last_name => 'Boxer', :position => 'US Senator', :image_link => 'images/barbara_boxer.jpg')
nancy = Person.create(:first_name => 'Nancy', :last_name => 'Pelosi', :position => 'US Representative', :image_link => 'images/nancy_pelosi.jpg')
dianne = Person.create(:first_name => 'Dianne', :last_name => 'Feinstein', :position => 'US Senator', :image_link => 'images/dianne_feinstein.jpg')

zip = Zipcode.create(:number => '94114')

mark.zipcodes << zip
tom.zipcodes << zip
barb.zipcodes << zip
nancy.zipcodes << zip
dianne.zipcodes << zip

mark.contacts.create(:location_city => 'Sacramento', :number => '9166514003')
mark.contacts.create(:location_city => 'San Francisco', :number => '4155571300')
mark.contacts.create(:location_city => 'San Rafael', :number => '4154796612')

tom.contacts.create(:location_city => 'San Francisco', :number => '4155573013')
tom.contacts.create(:location_city => 'Sacramento', :number => '9163192013')

barb.contacts.create(:location_city => 'Washington DC', :number => '2022243553')

nancy.contacts.create(:location_city => 'Washington DC', :number => '2022254965')

dianne.contacts.create(:location_city => 'Washington DC', :number => '2022243841')

if mark.save!
  puts "mark saved!"
else 
  puts "mark died...."
end

if tom.save!
  puts "tom saved!"
else
  puts "tom died...."
end

if barb.save!
  puts "barb saved!"
else
  puts "barb died..."
end

if nancy.save!
  puts "nancy saved!"
else
  puts "nancy died..."
end

if dianne.save!
  puts "dianne saved!"
else
  puts "dianne died...."
end
