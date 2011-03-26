class HolidayMailer < ActionMailer::Base
  default :from => "milkman@waldendairy.com"

  def holiday_email(customer)
    @customer = customer
    @url  = "http://waldendairy.com/sign_in"
    mail(:to => customer.email_address,
         :cc => "milkman@waldendairy.com",
         :reply_to => "problem@waldendairy.com",
         :subject => "Holiday dates")
  end
end
