class CreateSortNews < ActiveRecord::Migration
  def change
    create_table(:sort_news) do |t|
      t.references :news, index: true, foreign_key: true
      t.references :news_category, index: true, foreign_key: true
    end
  end
end
