json.extract! product, :id, :title, :favorite_count, :view_count, :like_count, :dislike_count, :comment_count, :products_url, :youtuber_id, :created_at, :updated_at
json.url product_url(product, format: :json)
