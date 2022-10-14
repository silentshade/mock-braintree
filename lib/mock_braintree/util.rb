module MockBraintree
  module Util
    module StringExtensions
      # Extracted from ActiveSupport::Inflections
      def underscore(camel_cased_word = self)
        return camel_cased_word.to_s unless /[A-Z-]|::/.match?(camel_cased_word)
        word = camel_cased_word.to_s.gsub("::", "/")
        word.gsub!(/([A-Z]+)(?=[A-Z][a-z])|([a-z\d])(?=[A-Z])/) { ($1 || $2) << "_" }
        word.tr!("-", "_")
        word.downcase!
        word
      end

      String.prepend(self)
    end
  end
end
