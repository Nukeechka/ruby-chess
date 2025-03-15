# frozen_string_literal: true

# module FileChars
module FileChars
  FILE_CHARS = %w[a b c d e f g h].freeze

  def file_from_char(file_char) # rubocop:disable Metrics/MethodLength
    file_map = {
      'a' => 1,
      'b' => 2,
      'c' => 3,
      'd' => 4,
      'e' => 5,
      'f' => 6,
      'g' => 7,
      'h' => 8
    }
    file_map[file_char]
  end
end
