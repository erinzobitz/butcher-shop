require 'spec_helper'

describe FavoritesController do
	let!(:favorite)  { create :favorite }
	subject                { response }

	describe "GET 'index'" do
		before(:each) { get :index, :format => :json, :user_id => favorite.user.id }

		its(:body)   { should_not be_empty }
		its(:status) { should be 200}
	end

	describe "POST 'create'" do
		before(:each) { post :create, {:user_id => favorite.user.id, :cut_id => 1}}

		its(:body)    { should_not be_empty }
		its(:status)  { should be 201 }
		its(:headers) { should include "Location" }
	end

	describe "GET 'show'" do
		before(:each) { get :show, :id => favorite.id, :format => :json }

		its(:body)    { should_not be_empty }
		its(:status)  { should be 200}

		context "with an unknown favorite" do
			before(:each) { get :show, :id => 9999, :format => :json }

			its("body.strip") { should be_empty }
			its(:status)      { should be 404 }
		end
	end

	describe "DELETE 'destroy'" do
		before(:each) { delete :destroy, :id => favorite.id, :format => :json }

		its("body.strip") { should be_empty }
		its(:status)      { should be 204 }
	end
end
