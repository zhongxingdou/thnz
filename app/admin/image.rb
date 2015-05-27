ActiveAdmin.register Image do
    permit_params :image

    form do |f|
      f.input :image, :as => :file
      f.actions
    end
end