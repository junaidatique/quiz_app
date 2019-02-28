require "application_system_test_case"

class QuizAttemptsTest < ApplicationSystemTestCase
  setup do
    @quiz_attempt = quiz_attempts(:one)
  end

  test "visiting the index" do
    visit quiz_attempts_url
    assert_selector "h1", text: "Quiz Attempts"
  end

  test "creating a Quiz attempt" do
    visit quiz_attempts_url
    click_on "New Quiz Attempt"

    fill_in "Correct answer", with: @quiz_attempt.correct_answer
    fill_in "Group", with: @quiz_attempt.group_id
    fill_in "Quiz", with: @quiz_attempt.quiz_id
    fill_in "Status cd", with: @quiz_attempt.status_cd
    fill_in "Total questions", with: @quiz_attempt.total_questions
    fill_in "User", with: @quiz_attempt.user_id
    click_on "Create Quiz attempt"

    assert_text "Quiz attempt was successfully created"
    click_on "Back"
  end

  test "updating a Quiz attempt" do
    visit quiz_attempts_url
    click_on "Edit", match: :first

    fill_in "Correct answer", with: @quiz_attempt.correct_answer
    fill_in "Group", with: @quiz_attempt.group_id
    fill_in "Quiz", with: @quiz_attempt.quiz_id
    fill_in "Status cd", with: @quiz_attempt.status_cd
    fill_in "Total questions", with: @quiz_attempt.total_questions
    fill_in "User", with: @quiz_attempt.user_id
    click_on "Update Quiz attempt"

    assert_text "Quiz attempt was successfully updated"
    click_on "Back"
  end

  test "destroying a Quiz attempt" do
    visit quiz_attempts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quiz attempt was successfully destroyed"
  end
end
