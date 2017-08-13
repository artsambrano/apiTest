Feature: Validate user list
  Background:
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * url 'https://reqres.in/api'

    * def readGetUserFeature = callonce read('../users/get-user-list.feature')
    * def getUserResponse = readGetUserFeature.response.data

    * def getUserNames = Java.type('validateUsers.ExtractUserData')
    * def responseResult = getUserNames.getNames(getUserResponse)

    Scenario: 1 Get and validate default page setting and list of users upon loading - with JAVA call
      * match responseResult contains ['george', 'oscar']
      * match responseResult contains ['1', '3']

    Scenario: 2 Get and validate default page setting and list of users upon loading - using raw response
      * match readGetUserFeature.response.data[*].first_name contains ['george', 'oscar']
      * match readGetUserFeature.response.data[*].id contains ['1', '3']

      Scenario: 3 Verify different page and display per page

        Given path 'users'
        And param page = '2'
        And param per_page = '5'
        When method get
        Then status 200

        * match each response.data contains {id: '#? _ < 11'}
        * match response.data[*].last_name !contains ['sam', 'marie']

    Scenario: 4 Verify that maximum number of users can be loaded in a single page

      Given path 'users'
      And param page = '1'
      And param per_page = '15'
      When method get
      Then status 200

      * match each response.data contains {id: '#? _ >= 1 && _ <= 12'}
      * match response.data[*].last_name !contains ['maeby', 'george michael', 'michael']

    Scenario Outline: 5 Boundary testing for pages and display per page

      Given path 'users'
      And param page = '<pageNum>'
      And param per_page = '<perPage>'
      When method get
      Then status 200

      * match each response.data !contains {id: '#number', first_name: '#string'}
      Examples:
        |pageNum|perPage|
        |2      |13     |
        |5      |4      |

  # Boundary cases:
    # Page no. 2 / display per page 15
    # Page no. 5 / display per page 4


