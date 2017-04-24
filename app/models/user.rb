class User < ActiveRecord::Base
	attr_accessor :remember_token
	attr_accessor :access_code
	#validate :access_code_valid, :on => :create
	before_save { self.email = email.downcase }
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@berkeley\.edu\z/i
  	validates :email, presence: true, length: { maximum: 255 }, 
  						format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  	has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	
	validates :phone, presence: true, length: { minimum: 10 }, allow_nil: true
	
	validates :year, presence: true
	
	has_attached_file :photo, styles: { large: "400x400", medium: "200x200", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates :photo, attachment_presence: true, allow_nil: true
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
	
  	# Returns the hash digest of the given string.
	def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
	end

	# Returns a random token.
	def User.new_token
	    SecureRandom.urlsafe_base64
	end

	# Remembers a user in the database for use in persistent sessions.
	def remember
	    self.remember_token = User.new_token
	    update_attribute(:remember_digest, User.digest(remember_token))
	end

	# Returns true if the given token matches the digest.
	def authenticated?(remember_token)
		return false if remember_digest.nil?
	    BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a user.
	def forget
    	update_attribute(:remember_digest, nil)
	end

	def access_code_valid
		unless self.access_code == "test"
    		self.errors.add(:access_code, ": invalid access code.")
		end
	end
end