class CreateProdCategories < ActiveRecord::Migration
  def change
    create_table :prod_categories do |t|
      t.string :name
      t.integer :order_no

      t.timestamps null: false
    end
  end
end
