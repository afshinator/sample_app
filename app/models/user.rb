class User < ActiveRecord::Base
  before_save { self.email = email.downcase }     # email is indexed in db, indexes should be lowercase
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
          uniqueness: { case_sensitive: false }
end
