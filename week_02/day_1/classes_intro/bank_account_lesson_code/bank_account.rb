class BankAccount

  attr_reader( :balance, :account_type )
  attr_accessor(:holder_name)

  def initialize(name, opening_balance, account_type)
    @holder_name = name
    @balance = opening_balance
    @account_type = account_type
  end

  def charge_fee()
    # if @account_type == 'business'
    #   @balance -= 70
    # elsif @account_type == 'personal'
    #   @balance -= 20
    # end

    # case @account_type
    # when 'business'
    #   @balance -= 70
    # when 'personal'
    #   @balance -= 20
    # end

    # fee = 0
    # if @account_type == 'business'
    #   fee = 70
    # elsif @account_type == 'personal'
    #   fee = 20
    # end
    # @balance -= fee

    fees = {
      'business' => 70,
      'personal' => 20,
      'savings' => 5
    }

    @balance -= fees[@account_type]
  end

  def pay_in( credit_amount )
    @balance += credit_amount
  end

end
