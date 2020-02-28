class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :to_id, null: false
      t.integer :from_id, null: false
      t.string :content, null: false
      
      t.timestamps
    end
  end
end
