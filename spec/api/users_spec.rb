require 'api_helper'
require_rel '../../app/api/users'

describe Grace::Api::Users do
  def app
    Grace::Api::Users
  end

  def mock_admin!
    allow_any_instance_of(Grace::Api::Users).to receive(:require_admin!)
  end

  def validate_fields! fields
    expected_fields = ['id', 'first_name', 'last_name', 'email_address',
                       'is_approved', 'is_admin']

    expect(fields.sort).to eq expected_fields.sort
  end

  describe 'get /api/users' do
    it 'requires an authenticated user' do
      get '/api/users'
      expect(last_response.status).to eq 403
    end

    describe 'with authentication' do
      before :each do
        mock_admin!
        get '/api/users'
        @response = JSON.parse last_response.body
      end

      it 'returns pagination information' do
        expect(@response).to have_key 'pagination'
      end

      it 'it by default returns an empty list' do
        expect(@response['users']).to have(0).items
      end
    end

    describe 'with authentication and multiple users' do
      before :each do
        (0..5).each do
          create(:user)
        end
        mock_admin!
      end

      it 'doesn\'t return unnecessary fields' do
        get '/api/users'
        response = JSON.parse last_response.body

        validate_fields! response['users'][0].keys
      end

      it 'responds to pagination parameters' do
        get '/api/users', per_page: 2
        response = JSON.parse last_response.body

        expect(response['pagination']['last_page']).to be false
      end
    end
  end

  describe 'get /api/users/:id' do
    it 'requires an authenticated user' do
      get '/api/users/3'
      expect(last_response.status).to eq 403
    end

    it 'requires the id parameter' do
      get '/api/users/'
      expect(last_response.status).to eq 404
    end

    describe 'with authentication and users' do
      before :each do
        (0..5).each do
          create(:user)
        end
        mock_admin!
      end

      it 'requires the id parameter' do
        get '/api/users/foo'
        expect(last_response).to_not be_ok
      end

      it 'returns the right fields' do
        get '/api/users/2'
        response = JSON.parse last_response.body

        validate_fields! response.keys
      end
    end
  end

  describe 'put /api/users/:id' do
    it 'requires an authenticated user' do
      put '/api/users/3'
      expect(last_response.status).to eq 403
    end
  end
end
