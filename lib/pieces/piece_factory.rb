# frozen_string_literal: true

require_relative './pawn'
require_relative './rook'
require_relative './knight'
require_relative './bishop'
require_relative './queen'
require_relative './king'

# class PieceFactory
class PieceFactory
  def from_fen_char(fen_char, coordinates) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    case fen_char
    when 'p'
      Pawn.new('black', coordinates)
    when 'P'
      Pawn.new('white', coordinates)
    when 'r'
      Rook.new('black', coordinates)
    when 'R'
      Rook.new('white', coordinates)
    when 'b'
      Bishop.new('black', coordinates)
    when 'B'
      Bishop.new('white', coordinates)
    when 'n'
      Knight.new('black', coordinates)
    when 'N'
      Knight.new('white', coordinates)
    when 'q'
      Queen.new('black', coordinates)
    when 'Q'
      Queen.new('white', coordinates)
    when 'k'
      King.new('black', coordinates)
    when 'K'
      King.new('white', coordinates)
    end
  end
end
