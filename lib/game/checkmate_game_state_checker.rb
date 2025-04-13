# frozen_string_literal: true

require_relative './game_state_checker'
require_relative './game_state'

# class CheckmateGameStateChecker
class CheckmateGameStateChecker < GameStateChecker
  def check(board, color) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    pieces = board.get_pieces_by_color(color)
    king = pieces.find do |piece|
      piece.instance_of?(::King)
    end
    return GameState::ONGOING unless board.square_attacked(king.coordinates, king.opposite_color)

    pieces.each do |piece|
      if piece.instance_of?(::King)
        king_available_move_squares	= piece.get_available_move_squares(board)
        king_available_move_squares.each do |coordinates|
          clone = BoardFactory.new.copy_board(board)
          clone.move_piece(Move.new(piece.coordinates, coordinates))
          return GameState::ONGOING unless clone.square_attacked(coordinates, king.opposite_color)
        end
      else
        available_move_squares = piece.get_available_move_squares(board)
        available_move_squares.each do |coordinates|
          clone = BoardFactory.new.copy_board(board)
          clone.move_piece(Move.new(piece.coordinates, coordinates))
          return GameState::ONGOING unless clone.square_attacked(king.coordinates, king.opposite_color)
        end
      end
    end
    return GameState::CHECKMATE_TO_WHITE_KING if color == 'white'

    GameState::CHECKMATE_TO_BLACK_KING
  end
end
