class AddPrevmsgToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :prevmsg, :integer
  end
end
