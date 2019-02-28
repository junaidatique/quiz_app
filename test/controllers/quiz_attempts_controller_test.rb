require 'test_helper'

class QuizAttemptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quiz_attempt = quiz_attempts(:one)
  end

  test "should get index" do
    get quiz_attempts_url
    assert_response :success
  end

  test "should get new" do
    get new_quiz_attempt_url
    assert_response :success
  end

  test "should create quiz_attempt" do
    assert_difference('QuizAttempt.count') do
      post quiz_attempts_url, params: { quiz_attempt: { correct_answer: @quiz_attempt.correct_answer, group_id: @quiz_attempt.group_id, quiz_id: @quiz_attempt.quiz_id, status_cd: @quiz_attempt.status_cd, total_questions: @quiz_attempt.total_questions, user_id: @quiz_attempt.user_id } }
    end

    assert_redirected_to quiz_attempt_url(QuizAttempt.last)
  end

  test "should show quiz_attempt" do
    get quiz_attempt_url(@quiz_attempt)
    assert_response :success
  end

  test "should get edit" do
    get edit_quiz_attempt_url(@quiz_attempt)
    assert_response :success
  end

  test "should update quiz_attempt" do
    patch quiz_attempt_url(@quiz_attempt), params: { quiz_attempt: { correct_answer: @quiz_attempt.correct_answer, group_id: @quiz_attempt.group_id, quiz_id: @quiz_attempt.quiz_id, status_cd: @quiz_attempt.status_cd, total_questions: @quiz_attempt.total_questions, user_id: @quiz_attempt.user_id } }
    assert_redirected_to quiz_attempt_url(@quiz_attempt)
  end

  test "should destroy quiz_attempt" do
    assert_difference('QuizAttempt.count', -1) do
      delete quiz_attempt_url(@quiz_attempt)
    end

    assert_redirected_to quiz_attempts_url
  end
end
