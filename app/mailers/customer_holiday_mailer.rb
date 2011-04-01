class CustomerHolidayMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def customer_holiday_email(customer_holiday)
    data = File.read(Rails.root.join('public/images/small_wd_banner.png'))
    data2 = File.read(Rails.root.join('public/images/small_sh_banner.png'))
    attachments.inline['small_wd_banner.png'] = data
    attachments.inline['small_sh_banner.png'] = data2

    @customer_holiday  = customer_holiday
    @url  = "http://waldendairy.com/sign_in"
    mail(:to => "#{customer_holiday.name} <#{customer_holiday.email_address}>",
         :cc => "milkman@waldendairy.com",
         :reply_to => "problem@waldendairy.com",
         :subject => "Holiday dates")
  end
end
