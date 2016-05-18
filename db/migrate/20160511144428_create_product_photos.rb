class CreateProductPhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer    :product_id
      t.string     :style
      t.binary     :file_contents
    end
  end

  def self.down
    drop_table :photos
  end
end
