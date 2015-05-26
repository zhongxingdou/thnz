class Product < ActiveRecord::Base
  belongs_to :category, 
             :class_name => "ProdCategory", 
             :foreign_key => "prod_category_id"
end
