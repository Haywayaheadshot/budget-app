require 'rails_helper'
require 'capybara'
require 'selenium-webdriver'
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome

RSpec.describe 'Welcome Page', type: :feature do
  before(:each) do
    visit unauthenticated_root_path
  end

  describe 'Landing Page' do
    it 'has welcome message' do
      expect(page).to have_content('WELCOME TO EXPENDITURE TRACKER')
    end

    it 'Has log in text and button' do
      expect(page).to have_content('Already a member?')
      expect(page).to have_button('Login')
    end

    it 'Has sign up text and button' do
      expect(page).to have_content('Not a member?')
      expect(page).to have_button('Sign Up')
    end

    it 'Has user name' do
      click_on(class: 'login-btn')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button('Log in')
    end

    it 'Has user name' do
      click_on(class: 'signup-btn')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Password confirmation')
      expect(page).to have_content('Upload a photo')
      expect(page).to have_button('Next')
    end
  end
end
