class FriendRequest < ApplicationRecord
    belongs_to :requestor, class_name: :User
    belongs_to :receiver, class_name: :User
 
    def request_accepted?
        self.status == true  
    end
end
