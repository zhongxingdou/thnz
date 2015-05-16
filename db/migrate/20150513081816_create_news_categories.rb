class CreateNewsCategories < ActiveRecord::Migration
  def change
    create_table :news_categories do |t|
      t.string :name
      t.references :news_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
