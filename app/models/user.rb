class User < ActiveRecord::Base
	include Extensions::UUID
	before_save { self.email = email.downcase }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, length: { maximum: 255 }, 
				  format: { with: VALID_EMAIL_REGEX }, 
				  uniqueness: { case_sensitive: false }

	validates :first_name, length: { maximum: 50 }
	validates :last_name, length: { maximum: 50 }
	
	has_secure_password validations: false
	

end
