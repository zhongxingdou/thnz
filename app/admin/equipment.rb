ActiveAdmin.register Equipment do
    permit_params :name, :pic

    form do |f|
        f.inputs "设备" do
            f.input :name, label: "设备名称"
            f.input :pic, label: "设备图片", :as => :rich_picker, :config => {:hidden_input => true, :allowed_styles => [:equipment]}
        end
        f.actions
    end
end
