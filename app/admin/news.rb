ActiveAdmin.register News do

  permit_params do
    permitted = [:title, :content, :created_at, :admin_id]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  index do
    selectable_column
    id_column
    column :title
    column :content
    column :created_at
    column :admin_id
    actions
  end

  filter :title
  filter :content
  filter :created_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :photo
    end
    f.actions
  end
  
end
