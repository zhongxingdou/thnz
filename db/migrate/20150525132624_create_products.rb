class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :show_in_home
      t.string :pic
      t.references :prod_category, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
