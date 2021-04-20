ActiveAdmin.register User do

  permit_params do
    permitted = [:email, :first_name, :last_name, :age, :address, :n_address, :city, :province]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :age
    column :address
    column :n_address
    column :city
    column :province
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :age
      f.input :address
      f.input :n_address
      f.input :city
      f.input :province
    end
    f.actions
  end

  
end
