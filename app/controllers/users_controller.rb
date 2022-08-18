class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:pending_friend_request]
    def index
        if user_signed_in?
            @users = User.where('id != ?', current_user.id)
        else
            @users = User.all
        end
    end

    def show
        @user = User.find(params[:id])

        @friendships = @user.friend_requests_as_requestor.where(status: true) + @user.friend_requests_as_receiver.where(status: true)
        @friendlist= []

        @friendships.each do |friendship|
            if @user.id == friendship.requestor_id
                @friendlist << friendship.receiver_id
            elsif @user.id == friendship.receiver_id
                @friendlist << friendship.requestor_id
            end
        end

        @friends = User.where(id:  [@friendlist])

    end

  
    def pending_friend_request
        if user_signed_in?
            @friend_requests = current_user.friend_requests_as_receiver.where(status: :false).pluck(:requestor_id)
            @users = User.where(id: [@friend_requests])
            if @users.empty?()
                @users = nil
            end
        else
            @users = nil
        end
    end

    def search
        @users = User.where("lower(first_name) Like :search or lower(last_name) Like :search", search: "%#{params[:query].downcase}%")
    end

end
