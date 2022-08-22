class FriendrequestsController < ApplicationController
    before_action :authenticate_user!
    def index 
        @friendships = current_user.friend_requests_as_requestor.where(status: true) + current_user.friend_requests_as_receiver.where(status: true)
        @friendlist= []

        @friendships.each do |friendship|
            if current_user.id == friendship.requestor_id
                @friendlist << friendship.receiver_id
            elsif current_user.id == friendship.receiver_id
                @friendlist << friendship.requestor_id
            end
        end

        @friends = User.where(id:  [@friendlist])
    end

    def create 
        @friendrequest = current_user.friend_requests_as_requestor.new(friend_request_params)

        if  @friendrequest.save
            redirect_to root_path
        end
    end

    def update
        @friendrequest = current_user.friend_requests_as_receiver.where(requestor_id: params[:id]).first
   
        if  @friendrequest != nil && @friendrequest.update(status: true)
            redirect_to root_path
        end
    end

    private
    def friend_request_params
      params.require(:user).permit(:receiver_id)
    end

end
