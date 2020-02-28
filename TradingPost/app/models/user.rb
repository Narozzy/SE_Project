class User < ApplicationRecord
  include Clearance::User
  has_many :listings, dependent: :destroy
  has_many :messages, dependent: :destroy
end
