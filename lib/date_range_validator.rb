class DateRangeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if (!value.nil?)
      record.errors[attribute] << "The to date must be greater or equal to from date" if record.from_date > record.to_date
    end
  end
end
