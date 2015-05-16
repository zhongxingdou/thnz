ActiveAdmin.register News do
  permit_params :published, :pubdate, :stick, :clicks, 
  :title, :subtitle, :content

  form do |f|
    f.inputs "发布信息" do
      f.input :published, label: "发布上线"
      f.input :stick, label: "置顶"

      f.input :pubdate, label: "发布日期"
      f.input :clicks, label: "点击数"
    end

    f.inputs "内容" do
      # f.input :category_ids, label: "所属栏目"
      # f.has_many :categories, heading: 'Themes', allow_destroy: false, new_record: false do |a|
        # a.input :name
      # end
      f.input :title, label: "标题"
      f.input :subtitle, label: "副标题"

      f.input :content, label: "内容", :as => :rich, 
        :config => 
          { 
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
            # :format_tags => ''
          }
    end

    f.actions
  end

end
