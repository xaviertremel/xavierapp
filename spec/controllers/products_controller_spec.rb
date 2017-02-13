require 'rails_helper'

describe ProductsController, :type => :controller do

  let(:product) { FactoryGirl.create(:product) }
  let(:user) { FactoryGirl.create(:user) }
  

  context 'GET #show' do
    before do
      get :show, id: product.id
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end


end