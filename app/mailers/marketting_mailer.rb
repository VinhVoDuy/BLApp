class MarkettingMailer < ApplicationMailer
  default from: "Blue River Hotel <blriverhotel@gmail.com>"
  def launch_web
    mail to: 'vinh.vo@2359media.com', subject: 'test now'
  end
end
