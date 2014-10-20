class UserMailer < ActionMailer::Base
  default from: 'notfiy-no-reply@rantly.com'

  def welcome_email(user, login_url)
    @user = user
    @login_url = login_url
    mail(to: user.email, subject: "Welcome to Rantly")

  end

  def confirmation_email(user, url)
    @user = user
    @confirmation_url = url
    mail(to: user.email, subject: "Confirming your email")
  end

  def follow_ranted_email(user, rant)
    @users = user
    @ranter = rant.user.username
    @rant_url = rant_url(rant.id)
    mail(to: @users, subject: "New Rant from #{@ranter}")
  end
end
