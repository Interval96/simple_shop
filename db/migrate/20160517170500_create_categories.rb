class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.timestamps
    end

    create_table :categories_products do |t|
      t.integer :product_id, null: false
      t.integer :category_id, null: false
    end
  end
end
