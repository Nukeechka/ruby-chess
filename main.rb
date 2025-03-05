# frozen_string_literal: true

require_relative './lib/board/board'
require_relative './lib/board/board_renderer'

board = Board.new
renderer = BoardRenderer.new
renderer.render(board)
