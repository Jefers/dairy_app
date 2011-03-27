class CustomerHolidayMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def customer_holiday_email(customer_holiday)
    @customer_holiday  = customer_holiday
    @url  = "http://waldendairy.com/sign_in"
    mail(:to => customer_holiday.email_address,
         :cc => "milkman@waldendairy.com",
         :reply_to => "problem@waldendairy.com",
         :subject => "Holiday dates")
  end
end
