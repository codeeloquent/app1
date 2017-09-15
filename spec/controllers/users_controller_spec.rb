require 'rails_helper'

describe UsersController, type: :controller do

	before do
		# @user = User.create!(email: 'yo@email.com', password: 'fedcba')
		@user = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user)
	end

	context 'POST #create' do
		before do
			sign_in @user
		end
		it 'successfully creates a new user' do
			expect(response).to have_http_status(200)
		end
	end
	
	context 'when a user is logged in' do
		before do
			sign_in @user
		end

		it 'loads correct user details' do
			get :show, params: {id: @user.id}
			expect(assigns(:user)).to eq @user
		end

		it 'cannot access another user show page' do
			get :show, params: {id: @user2.id}
			expect(response).to have_http_status(302)
			expect(response).to redirect_to(root_path)
		end
	end

	context 'when a user is not logged in' do
		it 'reirects to login' do
			get :show, params: {id: @user.id}
			expect(response).to redirect_to(new_user_session_path)
		end
	end
end