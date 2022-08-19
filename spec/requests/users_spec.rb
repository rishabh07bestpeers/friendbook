require 'rails_helper'

RSpec.describe "Users", type: :request do
  
  describe "GET /index" do
   
    it "renders the index template" do
      get users_path
      expect(response).to render_template("index")
    end
  end

  describe "GET /show" do
   
    
    
    it "renders the show template" do
      @user = User.create(
       
        first_name: 'rishabh',
        last_name: 'jain',
        phone: 9981256256,
        email: 'rishabh@gmail.com',
        password: 12341234
      )
     
      get user_path(@user)
      expect(response).to render_template("show")
    end
  end

  # describe "GET /pending_friend_request" do
   
  #   it "renders the index template" do
  #     @user = User.create(
       
  #       first_name: 'rishabh',
  #       last_name: 'jain',
  #       phone: 9981256256,
  #       email: 'rishabh@gmail.com',
  #       password: 12341234
  #     )
      
  #     get usersfriendrequests_path
  #     expect(response).to render_template(new_user_session_path)
  #   end
  # end

  describe "GET /search" do
   
    
    
    it "renders a success response" do
      @query = 'rishabh'
    
      get '/search', params: {query: @query}
      expect(response).to render_template("search")
    end
  end

end
