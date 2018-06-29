# frozen_string_literal: true

keep_tables = Settings.keep_tables_cms + Settings.keep_tables_master_data

config = {
  except: keep_tables
}

DatabaseCleaner.strategy = :truncation, config
Cucumber::Rails::Database.javascript_strategy = :truncation, config
