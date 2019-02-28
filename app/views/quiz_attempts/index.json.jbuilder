json.set! :data do
  json.array! @quiz_attempts do |quiz_attempt|
    json.partial! 'quiz_attempts/quiz_attempt', quiz_attempt: quiz_attempt
    json.url  "
              #{link_to 'Show', quiz_attempt }
              #{link_to 'Edit', edit_quiz_attempt_path(quiz_attempt)}
              #{link_to 'Destroy', quiz_attempt, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end