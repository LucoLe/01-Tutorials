Feature: Competitions
  As the boss
  I want to manage Competitions
  In order to improve my organization

  Background: There is a team
    Given There is a team called "Random"

  Scenario: Team enters a competition with no questions
    Given I have a competition with no questions
    When a team enters the competiotion
    Then I should see an error

  Scenario: Team enters a competiotion with questions
    Given I have a competition with questions
    When a team enters the competiotion
    Then I should not see an error