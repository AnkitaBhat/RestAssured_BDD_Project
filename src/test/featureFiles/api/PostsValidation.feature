@posts @api
Feature: Validate Posts from the API - (https://jsonplaceholder.typicode.com/posts/)

  Background: Endpoint Configuration
    Given The endpoint URI is already configured

  @posts @positive
  Scenario: I GET the Valid Posts
    Then I set the base path "/posts" to URI
    When I GET the valid endpoint at "1"
    Then I should have the status code "200" displayed
    And content type should be in "JSON" format
    And I validate the Schema of the response
    Then the body response content should be matched                   
    | userId | id | title                                                                      | body                                                                                                                                                             |
    | 1      | 1  | sunt aut facere repellat provident occaecati excepturi optio reprehenderit | quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto|

    
  @invalid
  Scenario: I get invalid Post
    Then I set the base path "/posts" to URI
    When I GET the valid endpoint at "155"
    Then I should have the status code "404" displayed

  @valid
  Scenario: I get the Valid Posts
    Then I set the base path "/posts" to URI
    And I set the request header "Content-Type" as "application/json"
    When I GET the valid endpoint at "100"
    Then I should have the status code "200" displayed
    And content type should be in "JSON" format
    And the body response content should be matched
     |userId   | id          | title                                  | body       |
	 | 10      | 100         | at nam consequatur ea labore ea harum  | cupiditate quo est a modi nesciunt soluta\nipsa voluptas error itaque dicta in\nautem qui minus magnam et distinctio eum\naccusamus ratione error aut |
 	
 
  @invalid
  Scenario: I get the invalid Post
    Then I set the base path "/posts" to URI
     When I GET the valid endpoint at "0"
    Then I should have the status code "404" displayed
    
    
  @valid
  Scenario: I get the Valid number of Posts
    Then I set the base path "/posts" to URI
    And I set the request header "Content-Type" as "application/json"
    When I GET the valid endpoint at ""
    Then I should have the status code "200" displayed
    And content type should be in "JSON" format
    And the body response Id should be matched
    | id     | 
	| 100    | 
 	