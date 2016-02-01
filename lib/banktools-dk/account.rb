module BankTools
  module DK
    class Account
      MIN_LENGTH = 11
      MAX_LENGTH = 14

      def initialize(number)
        @number = number
      end

      def valid?
        errors.empty?
      end

      def errors
        errors = []
        errors << :too_short if too_short?
        errors << :too_long if too_long?
        errors << :invalid_characters if any_non_numbers?
        errors
      end

      private

      def too_short?
        @number.size < MIN_LENGTH
      end

      def too_long?
        @number.size > MAX_LENGTH
      end

      def any_non_numbers?
        !@number.scan(/\D/).empty?
      end
    end
  end
end
