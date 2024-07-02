class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    trimmed_email = email.strip.downcase
    user = User.find_by_email(trimmed_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


  before_validation :downcase_email

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :password_confirmation, presence: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end 

end
