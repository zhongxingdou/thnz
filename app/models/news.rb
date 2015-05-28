class News < ActiveRecord::Base
    has_many :sort_news
    has_many :categories, :through => :sort_news, :source => :news_category
    
    resourcify
    accepts_nested_attributes_for :categories

    after_initialize :assign_defaults_on_new, if: 'new_record?'

    private
    def assign_defaults_on_new
        self.pubdate = DateTime.now
    end
end
