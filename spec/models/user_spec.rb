require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.new(
      
      last_name: 'jain',
      phone: 9981256256,
      email: 'rishabh@gmail.com',
      password: 12341234
    )

    @user2 = User.new(
      
      first_name: 'rishabh',
      phone: 9981256256,
      email: 'rishabh@gmail.com',
      password: 12341234
    )

    @user3 = User.new(
      
      first_name: 'rishabh',
      last_name: 'jainkk',
     
      email: 'rishabh@gmail.com',
      password: 12341234
    )

    
  end

  it "is invalid without first_name" do
      expect(@user).to_not be_valid  
  end

  it "is invalid without last_name" do
    expect(@user2).to_not be_valid  
  end

  it "is invalid without phone" do
    expect(@user3).to_not be_valid  
  end
 

  # describe "#has_last_name_greater_than_4" do
  #   it " has_last_name_greater_than_4" do
  #     expect(@user).to be_has_last_name_greater_than_4
  #   end
  # end

 
end
