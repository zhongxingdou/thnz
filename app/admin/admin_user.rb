ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,
                role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email, :input_html => {readonly: true}
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end


ActiveAdmin.register AdminUser, as: "ChooseRoles" do
  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  form do |f|
    f.inputs "选择角色" do
      f.input :email, :input_html => {readonly: true}
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

  controller do
    def create
      @user = AdminUser.new(permitted_params[:admin_user])
      add_roles(@user)
      create!
    end

    def update
      add_roles(resource)
      update!
    end

    private
    def add_roles(resource)
      alias current_user current_admin_user 
      if can? :update, Role
        resource.roles = []
        params[:admin_user][:role_ids].each { |r| resource.roles.push(Role.find(r)) unless r.blank? }
      end
    end
  end
end