require 'spec_helper'

describe FavoritesController do
	let(:favorite_attrs)     { { :format => :json, :favorite => attributes_for(:favorite) } }
  let(:bad_favorite_attrs) { { :format => :json, :favorite => nil } }
  let!(:favorite)  { create :favorite }
  subject                { response }

  describe "GET 'index'" do
  	before(:each) { get :index, :format => :json, :user_id => favorite.user.id }

    its(:body)   { should_not be_empty }
    its(:status) { should be 200}
  end

  describe "POST 'create'" do
    before(:each) { post :create, favorite_attrs }

    its(:body)    { should_not be_empty }
    its(:status)  { should be 201 }
    its(:headers) { should include "Location" }
  end

  describe "DELETE 'destroy'" do
    before(:each) { delete :destroy, :id => favorite.id, :format => :json }

    its("body.strip") { should be_empty }
    its(:status)      { should be 204 }
  end
end
