# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  subject {
    User.create(name: 'User to Test', email: 'user@mail.com', password: 'password',
                password_confirmation: 'password')
  }

  describe 'access to routes as public user' do
    it 'returns a successful response when go to users list' do
      get users_path
      expect(response).to be_successful
    end

    it 'returns a successful response when go to user #show' do
      get user_my_profile_path(subject)
      expect(response).to be_successful
    end

    it 'returns a successful response when go to #sign_up' do
      get new_user_registration_path
      expect(response).to be_successful
    end

    it 'returns a successful response when go to #sign_in' do
      get new_user_session_path
      expect(response).to be_successful
    end
  end
end
