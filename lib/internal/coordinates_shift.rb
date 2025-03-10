# frozen_string_literal: true

# class CoordinatesShift
class CoordinatesShift
  attr_accessor :file_shift, :rank_shift

  def initialize(file_shift, rank_shift)
    @file_shift = file_shift
    @rank_shift = rank_shift
  end
end
