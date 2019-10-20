class Listing < ApplicationRecord
    # Creates a master-detail relationship from this listing to an account
    belongs_to :user

    # Listing validation
    validates :title, presence: true, length: { minimum: 5, message: 'Must be 5 or more characters' }
    validates :isbn, presence: true, if: -> :is_book?
    validates :offer_type, presence: { message: 'List what type of item you are looking to post' }, 
    
    # Function to make validation logic clearer
    def is_book?
        offer_type == 'book'
    end
end
