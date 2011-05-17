class QuicknoteMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def quicknote_email(quicknote)
    data = File.read(Rails.root.join('public/images/small_wd_banner.png'))
    data2 = File.read(Rails.root.join('public/images/small_sh_banner.png'))
    attachments.inline['small_wd_banner.png'] = data
    attachments.inline['small_sh_banner.png'] = data2

    @quicknote  = quicknote
    @url  = "https://waldendairy.com/sign_in"
    @forgot_url = "https://waldendairy.com/customers/password/new"


    mail(:to => "#{quicknote.customer.name} <#{quicknote.customer.email}>",
         :cc => "milkman@waldendairy.com",
         :reply_to => "milkman@waldendairy.com",
         :subject => @quicknote.subject)
  end
end
