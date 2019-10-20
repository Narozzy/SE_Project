class User < ApplicationRecord
    # This creates a one-to-many relationship to the listings model
    has_many :listings
    # Validations for account creation, may want to create a separate class for validation
    validates :email, confirmation: true,
                      inclusion: { in: %w(edu), message: 'Must be a student email to register an account.'},
                      uniqueness: true
    validates :email_confirmation, presence: { message: 'Please confirm your email address' }
end
