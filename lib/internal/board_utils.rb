# frozen_string_literal: true

require_relative './coordinates'

# module BoardUtils
module BoardUtils
  def diagonal_coordinates_between(from, to) # rubocop:disable Metrics/MethodLength
    result = []
    file_shift = from.file < to.file ? 1 : -1
    rank_shift = from.rank < to.rank ? 1 : -1

    file_index = from.file + file_shift
    rank_index = from.rank + rank_shift
    loop do
      break if file_index == to.file && rank_index == to.rank

      result.push(Coordinates.new(file_index, rank_index))

      file_index += file_shift
      rank_index += rank_shift
    end
    result
  end

  def line_coordinates_between(from, to) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    result = []
    file_shift = from.file < to.file ? 1 : -1
    rank_shift = from.rank < to.rank ? 1 : -1

    file_index = from.file + file_shift
    rank_index = from.rank + rank_shift
    if from.file == to.file
      loop do
        break if rank_index == to.rank

        result.push(Coordinates.new(from.file, rank_index))

        rank_index += rank_shift
      end
    else
      loop do
        break if file_index == to.file

        result.push(Coordinates.new(file_index, from.rank))

        file_index += file_shift
      end
    end
    result
  end
end
