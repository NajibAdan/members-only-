class User < ApplicationRecord
    attr_accessor :token
    before_create :generate_token
    validates :email, presence: true
    validates :password, presence: true, length: {minimum: 6}
    has_many :posts
    has_secure_password
    def new_token 
        self.token = SecureRandom.urlsafe_base64.to_s
        update_attribute(:remember_digest,Digest::SHA1.hexdigest(token))
    end
    private
    def generate_token
        self.remember_digest = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    end    
end
