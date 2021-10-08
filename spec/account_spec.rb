require "banktools-dk"

RSpec.describe BankTools::DK::Account do
  describe "#valid?" do
    it "is true with no errors" do
      expect(account_with_number("12345678901234")).to be_valid
    end

    it "is false with errors" do
      expect(account_with_number("123")).not_to be_valid
    end

    it "handles whitespace" do
      expect(account_with_number("1234 567 890 1234")).to be_valid
    end

    it "handles dashes" do
      expect(account_with_number("1234-5678901234")).to be_valid
    end

    it "handles dots" do
      expect(account_with_number("1234.5678.901234")).to be_valid
    end
  end

  describe "#errors" do
    it "is empty when valid" do
      expect(account_with_number("12345678901").errors).to be_empty
    end

    it "includes TOO_SHORT if below 11 characters" do
      expect(account_with_number("1234567890").errors).to include(BankTools::DK::Errors::TOO_SHORT)
    end

    it "includes TOO_LONG if above 14 characters" do
      expect(account_with_number("123456789012345").errors).to include(BankTools::DK::Errors::TOO_LONG)
    end

    it "includes INVALID_CHARACTERS when number contains other characters than digits" do
      expect(account_with_number("1234567n890").errors).to include(BankTools::DK::Errors::INVALID_CHARACTERS)
    end
  end

  private

  def account_with_number(number)
    BankTools::DK::Account.new(number)
  end
end
