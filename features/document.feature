Feature: Document
  In order to remember my thoughts
  As an author
  I want to create a document

  Scenario: Create a document
    Given I am an author named: nobody
    And I want to create a document named: test
    And I want the document content to be: A bunch of words
    When I press create
    Then the author should be printed to the screen as: nobody
    And the title should be printed to the screen as: test
    And the contents should be printed to the screen as: A bunch of words
    And the second word of contents should be printed to the screen as: bunch
    And the number ot words in content should be printed to the screen as: 4
