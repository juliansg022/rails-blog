require 'rails_helper'

RSpec.describe Article, type: :model do

  user = User.new(id: 1, name: 'User', email: 'user@gmail.com')

  subject do
    user.articles.new(title: 'Anything',
                      body: 'Lorem ipsum',
                      status: 'public')
  end

  describe "Associations" do
  it { should belong_to(:user) }
end

  describe 'Validations' do
    it { should validate_presence_of(:user) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a status' do
      subject.status = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

  end


end
