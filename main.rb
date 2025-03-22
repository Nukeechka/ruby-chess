# frozen_string_literal: true

require_relative './lib/game/game'
require_relative './lib/board/board_factory'
require_relative './lib/board/board_renderer'

board_factory = BoardFactory.new
board = board_factory.board_from_fen('rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1')
game = Game.new(board)
game.game_loop
