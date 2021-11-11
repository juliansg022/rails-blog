# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:user) {
    User.create(name: 'User to Test', email: 'user@mail.com', password: 'password',
                password_confirmation: 'password')
  }
  subject {
    Article.create(title: 'Anything',
                   body: 'Lorem ipsum',
                   status: 'public',
                   user: user)
  }

  describe 'access to routes as public user' do
    it 'returns a successful response when go to articles list' do
      get articles_path
      expect(response).to be_successful
    end

    it 'returns a successful response when go to #show an article' do
      get article_path(subject)
      expect(response).to be_successful
    end

    it 'returns a redirection response when go to #create an article' do
      get new_article_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'returns a redirection response when go to #edit an article' do
      get edit_article_path(subject)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
