class Listing < ApplicationRecord
    belongs_to :user
    has_one_attached :img
end
