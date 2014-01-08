class User < ActiveRecord::Base
  before_save { self.email = email.downcase }     # email is indexed in db, indexes should be lowercase
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    # original
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i    # disallow double dots  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
          uniqueness: { case_sensitive: false }
  
  has_secure_password
  validates :password, length: { minimum: 6 }  
end
