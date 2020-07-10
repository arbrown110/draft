class User < ActiveRecord::Base
    has_secure_password
    has_many :traxes
    validates_presence_of :username, :email
end
