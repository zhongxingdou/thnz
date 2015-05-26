json.array!(@prod_categories) do |prod_category|
  json.extract! prod_category, :id, :name, :order_no
  json.url prod_category_url(prod_category, format: :json)
end
