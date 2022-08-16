class FriendrequestsController < ApplicationController
    def create 
        @friendrequest = current_user.friend_requests_as_requestor.new(friend_request_params)

        if  @friendrequest.save
            redirect_to root_path
        end
    end

    def update
        @friendrequest = current_user.friend_requests_as_receiver.where(requestor_id: params[:id]).first
        byebug
        if  @friendrequest.update(status: true)
            redirect_to usersfriendrequests_path
        end
    end

    private
    def friend_request_params
      params.require(:user).permit(:receiver_id)
    end

end
