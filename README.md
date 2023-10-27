# RestAssured_BDD_Project

REST API Automation Test project using Rest Assured and Cucumber BDD .

## Tools/Framework/Libraries
- JDK 1.8
- Maven - build tool
- Junit - test runner
- Cucumber - BDD/Gherkin style feature files and Step Definitions 
- Rest assured - Rest api verification library

## Setup Instruction
This is maven project , so start with 
```shell script
mvn clean install
```


### BDD (Feature file / Step definition)
BDD requires a feature file to invoke the step definitions:
- Create the scenarios in feature file as per the requirements, so each step in feature file has to match a step definition in class file;
- Following the BDD practices for coding;
- Using the special annotation like "@Before" which is the first method to run for each scenario. Moreover, this is the right place to set up the URI (endpoint) which will be called by HTTP request;

###REST API
- This project is aimed at calling Jsonplaceholder' API to validate the Posts. This is written in a feature file using Cucumber.
- Each line of the scenario is tied to backend code that actually executes the line (step).


### Verify JSON GET Request

Testing a simple response containing some JSON data.

- Request URL: https://jsonplaceholder.typicode.com/posts/1
- Request Method: GET
- Response Content-Type: application/json
- Response Body:
```json
{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
```
- Status Code: 200 OK

### Request not found
- Request URL: https://jsonplaceholder.typicode.com/posts/101
- Request Method: GET
- Response Body:
```json
{
  
}
```
- Status Code: 404 Not Found

### JSON schema validation
- The main goal is to ensure that the JSON format is correct as well as all data inside it. Therefore, it was created a json file (schema) and stored it in "resource" file in the package project. In the source-code is validated by the statement 'body(matchesJsonSchemaInClasspath(" file path json"))';

### How it is done (source-code)
#### Passing Id by parameter in feature file and calling GET request
- when().get("/" +Id)

#### Print in console the response
- then().log().all();

#### Check the status code, so the expected status is passed by parameter in feature file
- then().statusCode(Integer.parseInt(statusCode));

#### Check body response - In this case, the required format is JSON
- then().assertThat().contentType(ContentType.JSON).and().body(matchesJsonSchemaInClasspath("schema-json.json"));


