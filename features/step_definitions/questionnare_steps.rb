

When(/^user clicks the Optimierung link$/) do
  patiently do
  @questionnaire_page = QuestionnairePage.new
  @questionnaire_page.click_optimierung_link
  end
end

When(/^user is on the "Wo wohnst du" question$/) do
  @questionnaire_page.demand_check_question_one
end

Then(/^user selects the option "([^"]*)"$/) do |text|
  @questionnaire_page.select_the_option(text)
end

When(/^user sees the "Planst du, in den nächsten (\d+) Monaten ein Haus zu bauen\?" question$/) do |arg|
  @questionnaire_page.demand_check_question_two
end

When(/^user sees the "Besitzt du eines der folgenden Fahrzeuge\?" question$/) do
  @questionnaire_page.demand_check_question_three
end

And(/^user selects "([^"]*)" and "([^"]*)" options$/) do |text1, text2|
    @questionnaire_page.select_the_options(text1, text2)
end

When(/^user sees the "Welche Priorität besitzt die Absicherung von Besitz & Eigentum für dich\?" question$/) do
 patiently do
   @questionnaire_page.demand_check_question_four
 end
end

When(/^user sees the "Wie steht es um deine Famziliensituation\?" question$/) do
  @questionnaire_page.demand_check_question_five
end

When(/^users sees the "Hast du Kinder\?" question$/) do
  @questionnaire_page.demand_check_question_six
end

When(/^user sees the "Was machst du beruflich\?" question$/) do
  @questionnaire_page.demand_check_question_seven
end

When(/^user sees the "Was machst du in deiner Freizeit\?" question$/) do
end

When(/^user sees the "Hast du Tiere\?" question$/) do
  @questionnaire_page.demand_check_question_nine
end

When(/^user sees the "Wie wichtig ist dir die Absicherung deines Lebens und deiner Gesundheit\?" question$/) do
  @questionnaire_page.demand_check_question_ten
end

When(/^user sees the "Wie hoch ist dein aktuelles Jahresbruttogehalt\?" question$/) do
  @questionnaire_page.demand_check_question_eleven
end

And(/^user enters "([^"]*)" in input field$/) do |text|
  @questionnaire_page.enter_the_amount(text)
end

When(/^user sees the "Wie viel legst du monatlich zur Seite\?" question$/) do
  @questionnaire_page.demand_check_question_twelve
end

When(/^user sees the "Wie ist deine Risikoneigung hinsichtlich Finanzanlagen\?" question$/) do
  @questionnaire_page.demand_check_question_thirteen
end

When(/^user sees the "Wie wichtig ist dir die private Altersvorsorge\?" question$/) do
  @questionnaire_page.demand_check_question_fourteen
end

Then(/^user is on the demand check finished page$/) do
  @questionnaire_page.assert_demand_check_finished_path
end

Then(/^user navigates to recommendations page$/) do
  @questionnaire_page.assert_recommendations_path
end

