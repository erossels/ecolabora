ActiveAdmin.register Product do

  permit_params do
    permitted = [:category_id, :user_id, :description, :r_action, :status, :name]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column :name
    column :category_id
    column :user_id
    column :description
    column :r_action
    column :status
    actions
  end

  filter :name
  filter :category_id
  filter :status
  
end
