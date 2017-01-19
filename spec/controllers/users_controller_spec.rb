require 'rails_helper'

describe UsersController, :type => :controller do

  let(:user) { User.create!(email: 'xav84@hotmail.com', password: 'hotmail') }
  let(:user2) { User.create!(email: 'xav84@hotmail.fr', password: 'hotmail') }

  describe "GET #show" do

    context 'User is logged in' do
      before do
        sign_in user
      end

      it 'loads correct user details' do
        get :show, id: user.id
        expect(response).to have_http_status(200)
      end

      it 'cannot show user2 details and redirects to root_path' do
        get :show, id: user2.id
        expect(response).not_to have_http_status(200)
        expect(response).to redirect_to(root_path)
      end

      it 'cannot show user2 details and gets a 401 error' do
        get :show, id: user2.id
        expect(response).to have_http_status(401)
      end
    end

    context 'No User is logged in' do
      it 'redirects to login' do
        get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
        expect(assigns(:user)).to eq user
      end
    end

  end

end