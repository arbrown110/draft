class User < ActiveRecord::Base
    has_secure_password
    has_many :traxes
    validates :username, uniqueness: true
    validates :email, uniqueness: true

end
