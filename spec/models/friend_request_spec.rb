require 'rails_helper'

RSpec.describe FriendRequest, type: :model do
  describe "#request_accepted" do


    it "has accepted the friend request" do
      @freind_request = FriendRequest.new(requestor_id: 2, receiver_id: 1,status:true)
      expect(@freind_request).to be_request_accepted
    end
  end
end
