json.extract! product, :id, :category_id, :user_id, :description, :action, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
