# frozen_string_literal: true

require_relative './lib/board/board'
require_relative './lib/board/board_renderer'

board = Board.new
board.set_default_pieces_position
renderer = BoardRenderer.new
renderer.render(board)
