class User < ActiveRecord::Base

  EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


  scope :confirmed, -> {where.not(confirmed_at: nil)}

  #validates_confirmation_of :password
  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 30, allow_blank: false
  validate :email_format

  has_secure_password

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end

  def self.authenticate(email, password)
    # user = confirmed.find_by(email: email)
    # if user.present?
    #   user.authenticate
    # end
    # OU
    confirmed
    .find_by(email: email)
    .try(:authenticate, password)
  end

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

  before_create do |user|
    user.confirmation_token = SecureRandom.urlsafe_base64
  end

end
