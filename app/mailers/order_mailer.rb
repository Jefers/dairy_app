class OrderMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def order_email(order)
    data = File.read(Rails.root.join('public/images/small_wd_banner.png'))
    data2 = File.read(Rails.root.join('public/images/small_sh_banner.png'))
    attachments.inline['small_wd_banner.png'] = data
    attachments.inline['small_sh_banner.png'] = data2
    @order = order
    @url  = "http://waldendairy.com/customers/sign_in"
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
