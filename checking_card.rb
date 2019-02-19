module CheckingCard
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def set_type_if_card_valid
    puts set_type if luhn_algorithm_valid?
  end

  private

  def luhn_algorithm_valid?
    sum = 0
    number.delete(' ').split('').each_with_index do |value, index|
      if (index + 1) % 2 == 0
        sum += value.to_i
      else
        value_x_2 = value.to_i * 2
        value_x_2 > 9 ? sum += value_x_2.divmod(10).inject(:+) : sum += value_x_2
      end
    end
    sum % 10 == 0
  end

  def set_type
    credit_card = number.delete(' ')
    return 'Amex' if credit_card.length == 15 && (credit_card =~ /^(34|37)/) == 0
    return 'Discover' if credit_card.length == 16 && (credit_card =~ /^6011/) == 0
    return 'MasterCard' if credit_card.length == 16 && (credit_card =~ /^(5[1-5])/) == 0
    return 'VISA'   if [13,16].include?(credit_card.length) && (credit_card =~ /^4/) == 0
    return 'Unknown'
  end
end
