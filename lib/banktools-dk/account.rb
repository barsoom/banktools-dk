module BankTools
  module DK
    class Account

      def initialize(number)
        @number = number
      end

      def valid?
        @number.size.between?(11,14)
      end
    end
  end
end
