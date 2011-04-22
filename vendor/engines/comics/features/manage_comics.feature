@comics
Feature: Comics
  In order to have comics on my website
  As an administrator
  I want to manage comics

  Background:
    Given I am a logged in refinery user
    And I have no comics

  @comics-list @list
  Scenario: Comics List
   Given I have comics titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of comics
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @comics-valid @valid
  Scenario: Create Valid Comic
    When I go to the list of comics
    And I follow "Add New Comic"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 comic

  @comics-invalid @invalid
  Scenario: Create Invalid Comic (without title)
    When I go to the list of comics
    And I follow "Add New Comic"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 comics

  @comics-edit @edit
  Scenario: Edit Existing Comic
    Given I have comics titled "A title"
    When I go to the list of comics
    And I follow "Edit this comic" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of comics
    And I should not see "A title"

  @comics-duplicate @duplicate
  Scenario: Create Duplicate Comic
    Given I only have comics titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of comics
    And I follow "Add New Comic"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 comics

  @comics-delete @delete
  Scenario: Delete Comic
    Given I only have comics titled UniqueTitleOne
    When I go to the list of comics
    And I follow "Remove this comic forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 comics
 