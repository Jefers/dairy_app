module OrdersHelper
  def options_for_order_status(status)
    options_for_select(["pr","dr","pu","ok"], status)
  end

end