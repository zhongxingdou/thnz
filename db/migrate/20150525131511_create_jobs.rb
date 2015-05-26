class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :work_loc
      t.text :requirements
      t.text :description
      t.date :expired_date

      t.timestamps null: false
    end
  end
end
