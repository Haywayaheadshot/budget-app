require 'rails_helper'
require 'capybara'
require 'selenium-webdriver'
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.default_driver = :chrome


RSpec.describe 'Entities Page', type: :feature do
  before(:each) do
    @user = User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233', password_confirmation: '112233')
    @group = Group.create(name: 'Holiday', user_id: @user.id)
    @entity_one = Entity.create(name: "macDonalds", amount: 20, user_id: @user.id)
    @entity_two = Entity.create(name: "KFC", amount: 20, user_id: @user.id)
    @group_entity_one = GroupEntity.create(entity_id: @entity_one.id, group_id: @group.id)
    @group_entity_two = GroupEntity.create(entity_id: @entity_two.id, group_id: @group.id)
    visit unauthenticated_root_path
    click_on(class: 'login-btn')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on(class: 'log-in-submit-btn')
    click_on 'Holiday'
  end

  describe 'Landing Page' do
    it 'Has total amount of transactions' do
      expect(page).to have_content('Total Amount: $40.00')
      expect(page).to have_content('macDonalds')
      expect(page).to have_content('KFC')
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
      click_button('Create New Transaction')
      expect(page).to have_content('Name')
      expect(page).to have_content('Amount')
    end

    it 'to have save button' do
      click_on(class: 'add-transaction')
      expect(page).to have_button('Save')
    end
  end
end