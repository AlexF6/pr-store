json.extract! user, :id, :username, :email, :date_of_birth, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
