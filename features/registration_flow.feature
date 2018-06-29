@smoke
@javascript
Feature: Mandate Registration Flow
  As a lead
  I want to be able to register and see my cockpit
  After I finish the steps I will become a user

  Scenario: Mandate registers sees the cockpit
    Given lead is as the following
    | first_name | last_name   | email               | birthdate  | address_line1   | house_number | place     | zip_code | phone_number  |
    | Clark      | Automation  | automation@clark.de | 01.01.1970 | Goethestraße,10 |           10 | Frankfurt |    60313 |    1724568899 |
    And lead has the following inquiry categories
    | company              | category                      |
    | Allianz Versicherung | Privathaftpflichtversicherung |
    And lead is on the registration page
    And cockpit preview experiment is set to "control" variation

    Then lead sees the following five registration steps
    |          steps           |
    | Identität verifizieren   |
    | Versicherungen auswählen |
    | Persönliche Angaben      |
    | Einverständnis geben     |
    | Passwort wählen          |

    # Step 1
    When lead clicks on "Weiter" link
    And lead enters the phone number
    And lead clicks on Code senden button
    And lead enters the verification token
    Then lead is on the cockpit preview page

    # Step 2
    When lead clicks on Versicherungen hinzufügen button
    Then lead is on the targeting page

    When lead performs a search with the term "priva"
    And lead selects the category
    Then lead is on the company targeting page

    When lead performs a search with the term "allianz"
    And lead selects the company
    Then lead can see the selected inquiry category

    When lead clicks on Weiter button
    Then lead is on the profiling page

    # Step 3
    When lead fills the profiling form
    And lead clicks on the primary CTA
    Then lead is on the confirming page

    # Step 4
    When lead clicks on Jetzt unterschreiben button
    And lead enters their signature
    And lead clicks on the signature CTA
    And lead clicks on the primary CTA

    # Step 5
    When lead enters his password
    And lead clicks on "Registrierung abschließen" button
    Then lead is on the finished page

    # Finalize
    When lead clicks on the primary CTA
    Then user is on the manager page
    And user sees "Privathaftpflicht" card

    When user clicks the Optimierung link
    Then user clicks on "Bedarfscheck starten" button

    #Question 1
    When user is on the "Wo wohnst du" question
    Then user selects the option "In einer gemieteten Wohnung"

    #Question 2
    When user sees the "Planst du, in den nächsten 6 Monaten ein Haus zu bauen?" question
    Then user selects the option "Ja"

    #Question 3
    When user sees the "Besitzt du eines der folgenden Fahrzeuge?" question
    And user selects "Auto" and "Motorrad" options
    Then user clicks on the primary CTA

    #Question 4
    When user sees the "Welche Priorität besitzt die Absicherung von Besitz & Eigentum für dich?" question
    Then user clicks on the primary CTA

    #Question 5
    When user sees the "Wie steht es um deine Famziliensituation?" question
    Then user selects the option "Ich bin Single"

    #Question 6
    When users sees the "Hast du Kinder?" question
    Then user selects the option "Nein"

    #Question 7
    When user sees the "Was machst du beruflich?" question
    And user selects the option "Angestellter"
    Then user clicks on the primary CTA

    #Question 8
    When user sees the "Was machst du in deiner Freizeit?" question
    And user selects "Ich reise sehr viel" and "Ich arbeite gerne in Haus und Garten" options
    Then user clicks on the primary CTA

    #Question 9
    When user sees the "Hast du Tiere?" question
    And user selects "Hund" and "Katze" options
    Then user clicks on the primary CTA

    #Question 10
    When user sees the "Wie wichtig ist dir die Absicherung deines Lebens und deiner Gesundheit?" question
    Then user clicks on the primary CTA

    #Question 11
    When user sees the "Wie hoch ist dein aktuelles Jahresbruttogehalt?" question
    And user enters "60000" in input field
    Then user clicks on the primary CTA

    #Question 12
    When user sees the "Wie viel legst du monatlich zur Seite?" question
    And user enters "600" in input field
    Then user clicks on the primary CTA

    #Question 13
    When user sees the "Wie ist deine Risikoneigung hinsichtlich Finanzanlagen?" question
    Then user clicks on the primary CTA

    #Question 14
    When user sees the "Wie wichtig ist dir die private Altersvorsorge?" question
    And user clicks on the primary CTA
    Then user is on the demand check finished page

    When user clicks on "Jetzt zu deinem Ergebnis" button
    Then user navigates to recommendations page
