Feature: Get Single User
  Background:
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true

    * url 'https://reqres.in/api/users'

    Scenario: 1 Get an existing user by userId
      Given path '1'
      When method get
      Then status 200

      * match response.data contains {first_name: 'george', last_name: 'bluth'}

      Scenario: 2 Get an existing user from user list by providing the array index
        * def getUserFromList = call read('../users/get-user-list.feature')
        * def userId = getUserFromList.response.data[0].id

        Given path userId
        When method get
        Then status 200

        * match response.data contains {first_name: 'george', last_name: 'bluth'}

        Scenario: 3 Get a non-existing user
          Given path '20'
          When method get
          Then status 404