module Wingtips
  module HashUtils
    extend self

    def deep_merge(hash1, hash2)
      deep_merge!(hash1.dup, hash2)
    end

    def deep_merge!(hash1, hash2)
      hash1.merge! hash2 do |_key, value1, value2|
        if value1.respond_to?(:merge!) && value2.respond_to?(:merge!)
          HashUtils.deep_merge! value1, value2
        else
          value2
        end
      end
    end
  end
end