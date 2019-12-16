require('minitest/autorun')
require('minitest/rg')
require_relative('../bank_account')

class TestBankAccount < MiniTest::Test

  def test_account_name
    bank_account = BankAccount.new( 'John', 500, 'business' )
    assert_equal('John', bank_account.holder_name() )
  end

  def test_account_balance
    bank_account = BankAccount.new( 'John', 500, 'business' )
    assert_equal(500, bank_account.balance() )
  end

  def test_account_type
    bank_account = BankAccount.new( 'John', 500, 'business' )
    assert_equal('business', bank_account.account_type() )
  end

  def test_set_holder_name
    account = BankAccount.new('Alice', 4000, 'business')

    account.holder_name = 'Alicia'

    assert_equal('Alicia', account.holder_name )
  end

  def test_pay_fee
    account = BankAccount.new('Alice', 4000, 'business')
    account.charge_fee()
    assert_equal(3930, account.balance )
  end

  def test_pay_fee__personal
    account = BankAccount.new('Alice', 4000, 'personal')
    account.charge_fee()
    assert_equal(3980, account.balance )
  end

end
