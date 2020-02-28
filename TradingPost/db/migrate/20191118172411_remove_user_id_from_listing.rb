class RemoveUserIdFromListing < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :user_id, :reference
  end
end
