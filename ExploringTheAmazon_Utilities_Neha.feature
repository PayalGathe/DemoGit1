Feature: ExploringTheAmazon_Utilities

Background: 
Given I assign "Chrome" to variable "browser"
Given I assign "http://www.google.com" to variable "dstWebsite"
And I assign "http://www.amazon.in/" to variable "dstWebpage"


Scenario: Open Browser to Specified Page
Given I open $browser web browser
Then I navigate to $dstWebsite in web browser
And I wait 2 seconds
Then I navigate to $dstWebpage in web browser 
And I wait 2 seconds
Then I see element "xPath://a[@aria-label='Amazon']" in web browser
Then I echo "I am on Amazon Home Page"
And I wait 2 seconds


Scenario: Return to Amazon Homepage
Given I click element "xPath://a[@id='nav-logo-sprites']" in web browser
Then I echo "Return to Amazon Homepage"
And I wait 2 seconds


Scenario: Search for Item
Given I assign "compass" to variable "searchPhrase"
Then I type $searchPhrase in element "xPath://input[@id='twotabsearchtextbox']" in web browser 
And I wait 2 seconds
Then I click element "xPath://input[@id='nav-search-submit-button']" in web browser
And I wait 2 seconds
Then I save screenshot


Scenario: Navigate to Best Seller
Given I "navigate to the Best Sellers page"
Then I click element "xPath://a[text()='Best Sellers']" in web browser
Once I see element "xPath://div[text()='Amazon Bestsellers']" in web browser
Then I echo "I am on Best seller page"

@tag
Scenario: Prime Video selection

Given I click element "xPath:(//span[text()='All'])[2]" in web browser
And I wait 2 seconds

Then I click element "xPath://div[text()='Amazon Prime Video']" in web browser
And I wait 2 seconds

Then I click element "xPath://a[text()='All Videos']" in web browser
And I wait 2 seconds

If I see element "xPath://h1[text()='Welcome to Prime Video']" in web browser
Then I echo "I am on Prime Video page"
else I echo "I am not on Prime Video page"
EndIf
And I wait 5 seconds
And I close web browser