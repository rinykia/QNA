#конфигурация для acceptace 
require 'rails_helper'
require 'spec_helper'

RSpec.configure do |config|
  Capybara.javascript_driver = :webkit
  
  config.include AcceptanceHelper, type: :feature

  config.use_transactional_fixtures = false#Изменено/каждый тест оборачивается в транзакцию, этим управляет датабасе клианер.

  config.before(:suite) do #выполняется код перед запуском всего фаила со спеками
    DatabaseCleaner.clean_with(:truncation) #очищаем бд с truncation(- это установка размера таблицы на 0)
  end

  config.before(:each) do # перед каждым тестом мы ставим стратегию в положение транзакцию.
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do #для каждой спеки помеченой js: true мы используем :truncation а не :transaction
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do #запускаем перед каждым тестом старт
    DatabaseCleaner.start
  end

  config.after(:each) do #запускаем перед каждым тестом чистку
    DatabaseCleaner.clean
  end
end