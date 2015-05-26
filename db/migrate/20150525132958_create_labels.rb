class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
