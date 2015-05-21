class News < ActiveRecord::Base
    has_many :sort_news
    has_many :categories, :through => :sort_news, :source => :news_category
    
    resourcify

    accepts_nested_attributes_for :categories
end
