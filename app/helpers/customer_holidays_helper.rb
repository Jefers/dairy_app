module CustomerHolidaysHelper
  def urn_default(default)
    if current_customer.urn.nil?
      default = current_customer
    else
    end

  end
end
