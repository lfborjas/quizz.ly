Feature: manage quizzes
    In order to use this app
    As an examiner
    I want to create, edit, preview and view quizzes easily

    Scenario: Create a new quiz
        Given I am signed up and confirmed as "email@person.com/password"
        When I go to the new quiz page
        And I fill in "title" with "my quiz"
        And I fill in "participants" with "student1@school.edu, another@school.edu"
        And I fill in "questions" with "something in markdown"
        And I fill in "duration" with "two hours" 
        And I fill in "number of questions to show" with "10"
        And I press "Create"
        Then I should be in a quiz show page

    Scenario: See an existent quiz
        Given I created a quiz
        And   I am signed up and confirmed as "email@person.com/password"
        When I go to the quiz page
        Then I should see the versions
        And I should be able to edit it

    Scenario: list quizzes
        Given that I created quizzes
        And   I am signed up and confirmed as "email@person.com/password"
        When I go to the homepage
        Then I should see my quizzes

    Scenario: activate a quizz
        Given that I created a quizz 
        When I go to the quizz page
        And I press "activate"
        Then I should see "activated, x time left"
        And an email should have been sent to the participants

    Scenario: begin taking a quizz
        Given that I go to a quizz take page
        And the quizz is activated
        When I press start
        Then I should see "enter your name"
        And I should see "this quiz contains n questions"
        And those questions should have been randomly pulled

    Scenario: answer questions
        Given that I am taking a quizz
        Then I should see "n questions left" and my name

    Scenario: submit quizz
        Given that I go to the final page of a quizz
        And the quizz is not over
        When I press "submit"
        Then I should not be able to go back to the questions
        And I should see my score

    Scenario: check quizzes
        Given that a quizz is over
        When I go to the quizz page
        Then I should see "n responses"
        And a score for every response
