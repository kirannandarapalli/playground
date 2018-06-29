

module PageObject
  class QuestionnairePage < Base

    def click_optimierung_link
      force_click ".page-navigation__link--optimisations"
    end

    def demand_check_question_one
      expect(page).to have_text 'Wo wohnst du?'
    end

    def demand_check_question_two
      expect(page).to have_text 'Planst du, in den nächsten 6 Monaten ein Haus zu bauen?'
    end

    def demand_check_question_three
      expect(page).to have_text 'Besitzt du eines der folgenden Fahrzeuge?'
    end

    def demand_check_question_four
      expect(page).to have_text 'Welche Priorität besitzt die Absicherung von Besitz & Eigentum für dich?'
    end

    def demand_check_question_five
      expect(page).to have_text 'Wie steht es um deine Familiensituation?'
    end

    def demand_check_question_six
      expect(page).to have_text 'Hast du Kinder?'
    end

    def demand_check_question_seven
      expect(page).to have_text 'Was machst du beruflich?'
    end

    def demand_check_question_eight
      expect(page).to have_text 'Was machst du in deiner Freizeit?'
    end

    def demand_check_question_nine
      expect(page).to have_text 'Hast du Tiere?'
    end

    def demand_check_question_ten
      expect(page).to have_text 'Wie wichtig ist dir die Absicherung deines Lebens und deiner Gesundheit?'
    end

    def demand_check_question_eleven
      expect(page).to have_text 'Wie hoch ist dein aktuelles Jahresbruttogehalt?'
    end

    def demand_check_question_twelve
      expect(page).to have_text 'Wie viel legst du monatlich zur Seite?'
    end

    def demand_check_question_thirteen
      expect(page).to have_text 'Wie ist deine Risikoneigung hinsichtlich Finanzanlagen?'
    end

    def demand_check_question_fourteen
      expect(page).to have_text 'Wie wichtig ist dir die private Altersvorsorge?'
    end

    def enter_the_amount(amount)
      find(".form-list__item__input", visible: true).set(amount)
    end

    def select_the_option(option)
      page.find(".demand-check__inputs__list-item", text: option).click
    end

    def select_the_options(option1, option2)
      page.find(".demand-check__inputs__list-item__checkbox-section__text", text: option1).click
      page.find(".demand-check__inputs__list-item__checkbox-section__text", text: option2).click
    end

    def demand_check_finished_path
        "/de/app/demandcheck/finished"
    end

    def assert_demand_check_finished_path
      page.assert_current_path demand_check_finished_path
    end

    def recommendations_path
      "/de/app/manager/recommendations"
    end

    def assert_recommendations_path
      page.assert_current_path recommendations_path
    end
  end
end
