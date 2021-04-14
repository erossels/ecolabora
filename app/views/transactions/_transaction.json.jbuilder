json.extract! transaction, :id, :user_id, :product_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
