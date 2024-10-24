module PriceService
  def self.call(product, user)
    price = calculate_price(product.value, user.state)
    price -= calculate_category_discount(price, product.category)
    price -= calculate_birthday_discount(price, user.birthday_month)

    price.round(2)
  end

  private

  def self.calculate_price(value, state)
    tax_percentage = Tax.find(state) / 100.0
    tax_amount = value * tax_percentage
    value + tax_amount
  end

  def self.calculate_category_discount(price, category)
    price * Discount.by_category(category)
  end

  def self.calculate_birthday_discount(price, birthday_month)
    price * Discount.by_birthday(birthday_month)
  end
end
