json.extract! news, :id, :title, :content, :admin_id, :created_at, :updated_at
json.url news_url(news, format: :json)
