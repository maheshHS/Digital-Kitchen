class User < ApplicationRecord


  before_save { self.email = email.downcase }

  validates :fname, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 3, maximum: 25 }

  validates :lname, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 1, maximum: 25 }

  EMAIL_REG_EXPN = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REG_EXPN }

  has_secure_password

  def fullname
    "#{fname} #{lname}"
  end
end
