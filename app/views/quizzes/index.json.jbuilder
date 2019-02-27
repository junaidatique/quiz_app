json.set! :data do
  json.array! @quizzes do |quiz|
    json.partial! 'quizzes/quiz', quiz: quiz
    json.url  "
              #{link_to 'Show', quiz }
              #{link_to 'Edit', edit_quiz_path(quiz)}
              #{link_to 'Destroy', quiz, method: :delete, data: { confirm: 'Are you sure?' }}
              "
  end
end