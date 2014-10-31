class User < ActiveRecord::Base

	has_many :events #events completed this week. Reset every week
	
	validates :first_name, presence:{
		message: "You must enter your first name."
	}
	
	validates :last_name, presence:{
		message: "You must enter your last name."
	}
	
	validates :login, presence: {
		message: "You must enter a login."
	}
	validates :email, presence: {
		message: "You must enter an email."
	}
	validates :email, uniqueness: {
		message: "An account with that email already exists."
	}
	validates :login, uniqueness: {
		message: "That login already exists"
	}
	
	validate :passwordsMatch

	def savePasswords(password1, password2)
		@password1 = password1
		@password2 = password2
	end

	def passwordsMatch
		if @password1 != @password2 then
			self.errors.add(:Passwords, " do not match.")# lol

		end
		#if @password1.length < 4 then
			#self.errors.add(:Password, " is not long enough.")	
		#end#this causes errors with saving users programmatically
	end

	def password
		return @password
	end

	def password=(password)
		@password = password
		digest = Digest::SHA2.new(512)	
		self.salt = SecureRandom.hex(20).to_s
		self.password_digest = digest.hexdigest(self.salt + password)
	end

	def password_valid?(candidatePassword)
		digest = Digest::SHA2.new(512)
		encryptedCandidatePassword = digest.hexdigest(self.salt.to_s + candidatePassword.to_s)
		return encryptedCandidatePassword == self.password_digest
	end
end
