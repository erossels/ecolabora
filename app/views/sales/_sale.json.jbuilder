json.extract! sale, :id, :user_id, :product_id, :status, :created_at, :updated_at
json.url sale_url(sale, format: :json)
