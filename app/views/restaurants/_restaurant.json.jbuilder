json.extract! restaurant, :id, :name, :created_at, :updated_at
json.user restaurant.user
json.url restaurant_url(restaurant, format: :json)
