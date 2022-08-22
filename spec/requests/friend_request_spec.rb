require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do

  describe "GET /index" do
   
    it "redirected if not logged in" do
  

      get friendrequests_path
      assert_response :redirect
    end

    it "renders the index template" do
      @user = User.create(
       
        first_name: 'rishabh',
        last_name: 'jain',
        phone: 9981256256,
        email: 'rishabh@gmail.com',
        password: 12341234
      )
      sign_in @user
      get friendrequests_path
      expect(response).to render_template("index")
    end
  end

  describe "post /create" do
    it "redirected if not logged in" do
      post friendrequests_path
      assert_response :redirect
    end

    it "return success response" do
      @user = User.create(
       
        first_name: 'rishabh',
        last_name: 'jain',
        phone: 9981256256,
        email: 'rishabh@gmail.com',
        password: 12341234
      )
      sign_in @user
      post friendrequests_path, params: {user: {receiver_id: 1}}
      assert_response :success
    end

  end

  describe "patch /update" do
    it "redirected if not logged in" do
      @user = User.create(
       
        first_name: 'rishabh',
        last_name: 'jain',
        phone: 9981256256,
        email: 'rishabh@gmail.com',
        password: 12341234
      )

      patch friendrequest_path(@user)
      assert_response :redirect
    end

    it "return success response" do
      @user = User.create(
       
        first_name: 'rishabh',
        last_name: 'jain',
        phone: 9981256256,
        email: 'rishabh@gmail.com',
        password: 12341234
      )
      sign_in @user
      patch friendrequest_path(@user)
      assert_response :success
    end

  end
  
end