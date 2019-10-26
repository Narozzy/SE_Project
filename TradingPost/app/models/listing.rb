class Listing < ApplicationRecord
    validates :isbn, presence: { if: :is_book?, :message => 'ISBN must be defined for book listings' }
    validates :title, presence: :true

    def is_book?
        return self.product_type == 'book'
    end
end
