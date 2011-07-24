class AddImgToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :image_link, :string
  end

  def self.down
    remove_column :people, :image_link
  end
end
