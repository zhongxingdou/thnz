ActiveAdmin.register Product do
    permit_params :name, :show_in_home, :pic, :description, :prod_category_id

    form do |f|
        f.inputs "产品" do
            f.input :category, label: "产品分类"
            f.input :name, label: "产品名称"
            f.input :show_in_home, label: "在Home页显示"
            f.input :pic, label: "主图片", :as => :rich_picker, :config => {:hidden_input => true, :allowed_styles => [:prod_list]}
            f.input :description, label: "产品详情", :as => :rich, 
                :config => {
                    width:'79%',
                    height: '500px',
                    language: 'zh-cn',
                    skin: 'office2013',
                    toolbar: [
                      ['Source','-','Save','NewPage','Preview','-','Templates'],
                      ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
                      ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
                      ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
                      '/',
                      ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
                      ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
                      ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
                      ['Link','Unlink','Anchor'],
                      ['richImage','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
                      '/',
                      ['Styles','Format','Font','FontSize'],
                      ['TextColor','BGColor'],
                      ['Maximize', 'ShowBlocks','-','About']
                    ]
                }
        end

        f.actions
    end
end