# frozen_string_literal: true

require_relative './game/game'
require_relative './board/board_factory'
require_relative './board/board_renderer'

# class Chess
class Chess
  def initialize(fen)
    @board_factory = BoardFactory.new
    @fen = fen
    @board = @board_factory.board_from_fen(@fen)
    @game = Game.new(@board)
  end

  def save_game
    File.open('saved_game.marshal', 'wb') do |file|
      file.write(Marshal.dump(self))
    end
    puts 'Game saved'
    exit
  end

  def self.load_game
    if File.exist?('saved_game.marshal')
      File.open('saved_game.marshal', 'rb') do |file|
        Marshal.load(file) # rubocop:disable Security/MarshalLoad
      end
    else
      puts 'Not saved game'
      nil
    end
  end

  def menu # rubocop:disable Metrics/MethodLength
    puts '1. New game'
    puts '2. Load game'
    choice = gets.chomp

    case choice
    when '1'
      chess = Chess.new(@fen)
    when '2'
      chess = Chess.load_game
      chess ||= Chess.new
    else
      puts 'Incorrect choice. Try again'
      return menu
    end

    chess.play
  end

  def play
    state = @game.game_loop
    save_game if state == 'save'
  end
end
