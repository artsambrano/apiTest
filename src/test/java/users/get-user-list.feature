Feature: Get the list of users
  Background:
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * url 'https://reqres.in/api'

  Scenario: 1 Get and validate default page setting and list of users upon loading
    Given path 'users'
    When method get
    Then status 200


