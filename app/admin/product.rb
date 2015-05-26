ActiveAdmin.register Product do
    permit_params :name, :show_in_home, :pic, :description, :prod_category_id
end

