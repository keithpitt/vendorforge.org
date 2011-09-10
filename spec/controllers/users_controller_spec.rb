require 'spec_helper'

describe UsersController do

  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }

  context "#api_key" do

    context "with a current user" do

      before :each do
        sign_in user
      end

      it "should create an api_key instance of a version object" do
        get :api_key, :id => user.username, :format => :json

        response.should be_success
        JSON.parse(response.body).should == { "api_key" => user.authentication_token }
      end

      it "should only allow viewing the api_key for the current user" do
        get :api_key, :id => another_user.username, :format => :json

        response.should_not be_success
        response.status.should == 403
      end

    end

    context "with no user" do

      it "should redirect to login" do
        get :api_key, :id => "keithpitt", :format => :json

        response.should_not be_success
        response.status.should == 401
      end

    end

  end

end
