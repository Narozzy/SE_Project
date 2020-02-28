class AddListingidToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :listing_id, :integer
  end
end
