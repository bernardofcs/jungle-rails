class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  # default from: "postmaster@sandboxd83897051e3d437d83dd7644ce065058.mailgun.org"
  default from: "no-reply@jungle.com"
  
  def new_record_notification(order)
    @order = order
    mail to: order.email, subject: "Order completed!"
  end
end
