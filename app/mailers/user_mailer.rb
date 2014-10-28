class UserMailer < ActionMailer::Base
  default from: 'notify-no-reply@rantly.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Rantly")

  end

  def confirmation_email(user, url)
    @user = user
    @confirmation_url = url
    mail(to: user.email, subject: "Confirming your email")
  end

  def follow_ranted_email(users, rant)
    @users = users
    @ranter = rant.user.username
    @rant_url = user_rant_url(rant.user.id, rant.id)
    mail(to: @users, subject: "New Rant from #{@ranter}")
  end
end
