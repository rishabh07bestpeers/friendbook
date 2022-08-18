require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = User.new(
      
      last_name: 'jainkk',
      phone: 9981256256,
      email: 'rishabh@gmail.com',
      password: 12341234
    )
  end

  it "is invalid without first_name" do
      expect(@user).to_not be_valid  
  end

  describe "#has_last_name_greater_than_4" do
    it " has_last_name_greater_than_4" do
      expect(@user).to be_has_last_name_greater_than_4
    end
  end

 
end
