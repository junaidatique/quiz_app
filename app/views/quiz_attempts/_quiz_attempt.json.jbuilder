json.extract! quiz_attempt, :id, :quiz_id, :user_id, :group_id, :total_questions, :correct_answer, :status_cd, :created_at, :updated_at
json.url quiz_attempt_url(quiz_attempt, format: :json)
