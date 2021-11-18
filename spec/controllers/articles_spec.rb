# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:user) { create(:user) }

  let(:additional_user) { create(:user) }

  let(:article) { create(:article, user: user) }

  let(:attributes) do
    {
      title: article.title,
      body: article.body,
      status: article.status,
      user_id: article.user.id
    }
  end

  let(:invalid_attributes) { attributes.merge(status: 'secret') }

  subject { response }

  describe '#index' do
    context 'when successfully accessed' do
      it 'returns status code 200' do
        get :index
        is_expected.to have_http_status(200)
      end
    end
  end

  describe '#show' do
    context 'when successfully accessed' do
      it 'returns status code 200' do
        get :show, params: { id: article.id }
        is_expected.to have_http_status(200)
      end
    end
  end

  describe '#new' do
    context 'when is logged in' do
      it 'returns status code 200' do
        sign_in(user)
        get :new
        is_expected.to have_http_status(200)
      end
    end

    context 'when is not logged in' do
      it 'returns status code 302' do
        get :new
        is_expected.to have_http_status(302)
      end
    end
  end

  describe '#edit' do
    context 'when is logged in' do
      it 'returns status code 200' do
        sign_in(user)
        get :edit, params: { id: article.id }
        is_expected.to have_http_status(200)
      end
    end
    context 'when is not logged in' do
      it 'returns status code 302' do
        get :edit, params: { id: article.id }
        is_expected.to have_http_status(302)
      end
    end
  end

  describe '#create' do
    before { sign_in(user) }
    context 'when has valid attributes' do
      it 'returns status code 302' do
        post :create, params: { article: attributes }
        is_expected.to have_http_status(302)
      end
    end

    context 'when has not valid attributes' do
      it 'returns status code 200' do
        post :create, params: { article: invalid_attributes }
        is_expected.to have_http_status(200)
      end
    end
  end

  describe '#update' do
    before { sign_in(user) }

    context 'when is via patch' do
      it 'returns status code 302' do
        patch :update, params: { id: article.id, article: attributes }
        is_expected.to have_http_status(302)
      end

      it 'returns status code 200' do
        patch :update, params: { id: article.id, article: invalid_attributes }
        is_expected.to have_http_status(200)
      end
    end

    context 'when is via put' do
      it 'returns status code 302' do
        put :update, params: { id: article.id, article: attributes }
        is_expected.to have_http_status(302)
      end

      it 'returns status code 200' do
        put :update, params: { id: article.id, article: invalid_attributes }
        is_expected.to have_http_status(200)
      end
    end
  end

  describe '#destroy' do
    context 'when is successfully' do
      before { sign_in(user) }
      it 'returns status code 302' do
        delete :destroy, params: { id: article.id }
        is_expected.to have_http_status(302)
      end
    end

    context 'when fails' do
      before { sign_in(additional_user) }
      it 'returns status code 204' do
        delete :destroy, params: { id: article.id }
        is_expected.to have_http_status(204)
      end
    end
  end
end
