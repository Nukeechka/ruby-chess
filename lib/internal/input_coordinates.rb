# frozen_string_literal: true

require_relative './file_chars'

# class InputCoordinates
class InputCoordinates
  include FileChars

  def input # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    loop do
      puts 'Please enter coordinates (ex. a1)'
      line = gets.chomp

      if line.length != 2
        puts 'Invalid format'
        continue
      end

      file_char = line.chars[0].downcase
      rank_char = line.chars[1].to_i

      unless FileChars::FILE_CHARS.include?(file_char)
        puts 'Invalid format'
        continue
      end

      unless rank_char <= 0 || rank_char > 8
        puts 'Invalid format'
        continue
      end

      formatted_file = FileChars.file_from_char(file_char)

      Coordinates.new(formatted_file, rank_char)
    end
  end
end
