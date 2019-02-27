json.extract! quiz, :id, :user_id, :product_id, :group_id, :title, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
