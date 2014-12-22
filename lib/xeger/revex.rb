module Xeger
  class Revex

    WORD_KEYS = {
      captilazed_word: "[A-Z][a-z]+",
      lowercase_word: '[a-z]+',
      uppercase_word: '[A-Z]+',
      mixedcase_word: '[a-zA-Z]+'
    }

    NUMBER_KEYS = {
      all_digits: '\d+',
    }

    EDGE_KEYS = {
      hyphenated_word: '\w+-\w+',
    }

    def for_string(string)
      final_regex = []
      string.split.each do |word|
        final_regex << for_word(word)
      end
      final_regex.join(" +")
    end

    def for_word(word)
      @string = word
      final_regex = ""
      final_regex << handle_words
      final_regex << handle_numbers
      final_regex << handle_edges
      if final_regex == "" && word =~ /\w+/
        return /\w+/
      end
      final_regex
    end

    private


    def handle_numbers
      test_keys NUMBER_KEYS
    end

    def handle_words
      test_keys WORD_KEYS
    end

    def handle_edges
      test_keys EDGE_KEYS
    end

    def test_keys(hash)
      hash.each do |word, regex|
        return regex if @string =~ /^#{regex}$/
      end
      ""
    end

  end
end
