class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :isbn
      t.string :title
      t.string :product_type

      t.timestamps
    end
  end
end
