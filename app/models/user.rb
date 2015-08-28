class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


  #validates_confirmation_of :password
  validates_presence_of :email, :full_name, :location, :password
  validates_length_of :bio, minimum: 30, allow_blank: false
  validate :email_format

  has_secure_password

  private

  #igual a validates_format_of :email, with: EMAIL_REGEX

  #igual também a
  #validate do
  #def email_format
  #  errors.add(:email, :invalid) unless email.match(EMAIL_REGEX)
  #end


  def email_format
    errors.add(:email, :invalid) unless email.match(EMAIL_REGEX)
  end
end
