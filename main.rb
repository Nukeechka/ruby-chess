# frozen_string_literal: true

require_relative './lib/board/board'
require_relative './lib/board/board_renderer'
require_relative './lib/internal/coordinates'

board = Board.new
board.set_default_pieces_position
renderer = BoardRenderer.new
renderer.render(board)
piece = board.get_piece(Coordinates.new(7, 8))
puts piece
available_move_squares = piece.get_available_move_squares(board)
p available_move_squares
