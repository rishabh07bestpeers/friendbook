class UsersController < ApplicationController
    def index
        if user_signed_in?
            @users = User.where('id != ?', current_user.id)
        else
            @users = User.all
        end
    end

  
    def pending_friend_request
        if user_signed_in?
            @friend_requests = current_user.friend_requests_as_receiver.where(status: :false).pluck(:requestor_id)
            @users = User.where(id: [@friend_requests])
            if !@user
                @users = nil
            end
        else
            @users = nil
        end
    end

end
