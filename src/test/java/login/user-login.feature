Feature: Validate login
  Background:
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * url 'https://reqres.in/api'

    Scenario Outline: Login with different cases
      Given path 'login'
      And request {email: '<email>', password: '<password>'}
      When method post
      Then status 200

      * match response contains {token: '#notnull'}
      Examples:
      |email        |password   |
      |peter@klaven | cityslicka|
      |peter@klaven |city slicka|
      |peter@klaven |cityslicka |

      Scenario: Login unsuccessfully
        Given path 'login'
        And request {email: 'peter@klaven', password: ''}
        When method post
        Then status 400

        * match response.error == 'Missing password'