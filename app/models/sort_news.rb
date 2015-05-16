class SortNews < ActiveRecord::Base
  belongs_to :news
  belongs_to :news_category
end
