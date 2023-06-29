require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(email: 'test1@mail.com', name: 'nameTest1', password: '112233') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'validates the email' do
    expect(subject.email).to match(/\A[\w+-.]+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i)
  end
end
