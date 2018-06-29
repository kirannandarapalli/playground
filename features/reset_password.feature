@smoke
@javascript
Feature: Password reset flow
  As a customer
  I want to be able to reset the password

  Scenario:
    Given user is on the homepage
    When user clicks on "Login" link
    Then user clicks "Passwort vergessen?" link
    When user is on Passwort vergessen overlay
    And user sees following elements
      | Email input field  |
      | Neues Passwort anfordern button|
      | Zurück zum Login link |
    Then user enters the email id in passwort vergessen overlay
    When user clicks Neues Passwort anfordern button
    Then user sees the "Vielen Dank, bitte überprüfe deinen Posteingang!" message

    When user logins to web mail
    And user opens the reset password link in email
    And user clicks the password Zurücksetzen button
    Then user sees the reset password page

    When user enters the new password
    And user enters the confirm password
    And user clicks on "Passwort andern" button
    Then user logged into clark and sees cockpit overview page
