class Signup < ActionMailer::based
  default from: 'no-reply@colcho.net'

  def confirm_email user

    @user = user
    @confirm_link = root_url

    mail({
      to: user.email
      bcc: ['sign ups <signups@colcho.net>']
      subject: I18n.t('signupd.confirm_email.subject')
      })
  end

end
