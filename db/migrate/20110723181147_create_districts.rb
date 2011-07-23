class CreateDistricts < ActiveRecord::Migration
  def self.up
    create_table :districts do |t|
      t.integer :person_id
      t.integer :zipcode_id
      t.timestamps
    end
  end

  def self.down
    drop_table :districts
  end
end
