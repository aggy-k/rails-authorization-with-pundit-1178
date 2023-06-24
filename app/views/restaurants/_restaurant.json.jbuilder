json.extract! restaurant, :id, :name, :created_at, :updated_at
json.user restaurant.user
json.can_edit policy(restaurant).edit?
json.url restaurant_url(restaurant, format: :json)
