module Discount
  CATEGORIES = %w(food beverages)
  CATEGORY_DISCOUNT = 0.05
  BIRTHDAY_DISCOUNT = 0.1

  def self.by_category(category)
    return CATEGORY_DISCOUNT if CATEGORIES.include?(category)

    0
  end

  def self.by_birthday(birthday_month)
    return BIRTHDAY_DISCOUNT if is_birthday_month?(birthday_month)

    0
  end

  private

  def self.is_birthday_month?(month)
    Time.now.month == month
  end
end
