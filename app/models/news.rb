class News < ActiveRecord::Base
    has_many :sort_news
    has_many :categories, :through => :sort_news, :source => :news_category
    
    resourcify
end
