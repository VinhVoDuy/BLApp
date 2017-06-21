class MarkettingMailer < ApplicationMailer
  default from: "Blue River Hotel <blriverhotel@gmail.com>"
  def launch_web contact
    @email = contact.email
    @name = contact.full_name
    mail to: @email, subject: 'SUMMER DEAL - save up to 30% (only available on our website)'
  end
end
