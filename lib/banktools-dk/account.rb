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
        errors << :too_short if @number.size < MIN_LENGTH
        errors << :too_long if @number.size > MAX_LENGTH
        errors << :invalid_characters if !@number.scan(/\D/).empty?
        errors
      end
    end
  end
end
