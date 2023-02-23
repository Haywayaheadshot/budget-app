require 'rails_helper'
require 'capybara'
require 'selenium-webdriver'
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome


RSpec.describe 'Groups Page', type: :feature do
  before(:each) do
    @user = User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233', password_confirmation: '112233')
    @group = Group.create(name: 'Holiday', user_id: @user.id)
    visit unauthenticated_root_path
    click_on(class: 'login-btn')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on(class: 'log-in-submit-btn')
  end

  describe 'Landing Page' do
    it 'Has create new group button' do
      expect(page).to have_content('Create New Group')
    end

    it 'Has log out button' do
        expect(page).to have_content('Log out')
    end

    it 'Has hamburger' do
        expect(page).to have_css('.hamburger', visible: false)
    end

    it 'Has profile picture' do
        expect(page).to have_css('.profile-dp')
        expect(page).to have_css('.user-name')
    end

    it 'Has user name' do
        expect(page).to have_content('nameTest1')
    end

    it 'displays the form to create a new group' do
        click_on(class: 'add-transaction')
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
    end

    it 'to have save button' do
      click_on(class: 'add-transaction')
      expect(page).to have_button('Save')
    end
  end
end