# frozen_string_literal: true

require_relative './game_state'
require_relative './game_state_checker'

# class StalemateGameStateChecker
class StalemateGameStateChecker < GameStateChecker
  def check(board, color)
    pieces = board.get_pieces_by_color(color)
    pieces.each do |piece|
      available_move_squares = piece.get_available_move_squares(board)
      return GameState::ONGOING unless available_move_squares.empty?
    end
    GameState::STALEMATE
  end
end
