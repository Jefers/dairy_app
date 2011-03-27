class OrderMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def order_email(order)
    data = File.read(Rails.root.join('public/images/small_wd.png'))
    attachments.inline['small_wd.png'] = data
    @order = order
    @url  = "http://waldendairy.com/sign_in"
    mail(:to => order.email,
         :cc => "milkman@waldendairy.com",
         :reply_to => "problem@waldendairy.com",
         :subject => "Thank you for your order")
  end

  def confirmation(order)
    @order = order
    mail(:to => order.email, :subject => 'Your PDF purchase')
  end


end
