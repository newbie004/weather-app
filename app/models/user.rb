class User < ApplicationRecord
    # class for user in order to use ORM. 
    # Any kind of input parameter validation will exist here.
    # has_secure_password
    # set up password encryption using BCrypt
    # Add a method to set and verify passwords
  
    def password=(password)
        @password = password
        self.password_digest = password_hash(password)
    end
    
    def authenticate(password)
        salt, hashed_password = password_digest.split(':')
        provided_password_hash = password_hash(password, salt)
        provided_password_hash == "#{salt}:#{hashed_password}"
    end
    
    private
    
    def password_hash(password, salt = nil)
        salt ||= SecureRandom.hex(16) # Generate a random salt if not provided
        hashed_password = Digest::SHA256.hexdigest("#{salt}#{password}")
        "#{salt}:#{hashed_password}"
    end
end
