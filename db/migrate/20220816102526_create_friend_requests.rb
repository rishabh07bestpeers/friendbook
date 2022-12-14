class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.integer :requestor_id
      t.integer :receiver_id
      t.boolean :status, default: :false
      t.timestamps
    end
  end
end
