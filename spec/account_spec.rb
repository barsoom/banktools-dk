require "spec_helper"
require "banktools-dk"

describe BankTools::DK::Account do
  it "is valid with a number of 11 to 14 digits" do
    expect(account_with_number("12345678901")).to be_valid
    expect(account_with_number("12345678901234")).to be_valid
  end

  it "is not valid when number is above 14 in length" do
    expect(account_with_number("123456789012345")).not_to be_valid
  end

  it "is not valid when below 11" do
    expect(account_with_number("1234567890")).not_to be_valid
  end

  private

  def account_with_number(number)
   BankTools::DK::Account.new(number)
 end
end
