require 'spec_helper'

describe Api::V1::UsersController do

  describe "POST #create" do

    context "should create user successfully and" do 
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }, format: :json
      end
      
      it "render correct json representation for the user record just created" do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end
      
    end
    
    context "should fail to create new user when email is not present and" do
      before(:each) do
        @invalid_user_attributes = FactoryGirl.attributes_for :user
        @invalid_user_attributes["email"] = nil
        post :create, { user: @invalid_user_attributes }, format: :json
      end
      
      it "should have email key in response" do
        user_response = json_response
        expect(user_response).to have_key(:email)
      end
      
      it "should contain the respective error message" do
          user_response = json_response
          expect(user_response[:email]).to include "can't be blank"
      end
      
    end
  end

end
