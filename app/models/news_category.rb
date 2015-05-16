class NewsCategory < ActiveRecord::Base
    has_many :sort_news
    has_many :news, through: :sort_news

    has_many :sub_categories, class_name: "NewsCategory", foreign_key: "news_category_id"
    belongs_to :parent, class_name: "NewsCategory", foreign_key: "news_category_id"
end
