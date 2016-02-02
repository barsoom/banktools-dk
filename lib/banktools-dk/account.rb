module BankTools
  module DK
    class Account
      # The number consists of a 4 digit bank registration number followed by a 7-10 digits long account number with no punctuation, dashes or whitespaces. See https://www.nordea.se/Images/40-11936/utlandsbetalningar-landinformation.pdf for information in Swedish.
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
        errors << :invalid_characters if any_non_digits?
        errors
      end

      private

      def too_short?
        @number.size < MIN_LENGTH
      end

      def too_long?
        @number.size > MAX_LENGTH
      end

      def any_non_digits?
        @number.match(/\D/)
      end
    end
  end
end
