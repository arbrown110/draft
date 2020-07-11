class User < ActiveRecord::Base
    has_secure_password
    has_many :traxes
    validates :username, uniqueness: true, presence: true
    validates :email, uniqueness: true, presence: true

end
