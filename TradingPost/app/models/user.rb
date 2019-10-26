class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true,
               format: { with: /\A([a-zA-Z]|\d)+@([a-zA-Z]|\d)+(.edu)\z/i, message: "Your email must contain \".edu\""}
end
