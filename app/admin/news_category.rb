ActiveAdmin.register NewsCategory do
    permit_params :name, :news_category_id


  index do
    # selectable_column
    id_column
    column :name
    column :news_category_id
    column :created_at
    column :updated_at
    actions
  end
end
