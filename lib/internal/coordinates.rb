# frozen_string_literal: true

# class Coordinates
class Coordinates
  attr_accessor :file, :rank

  def initialize(file, rank)
    @file = file
    @rank = rank
  end

  def shift(shifts)
    Coordinates.new(@file + shifts.file_shift, @rank + shifts.rank_shift)
  end

  def can_shift?(shifts)
    f = @file + shifts.file_shift
    shift.rank_shift

    return false if f <= 0 || f > 8
    return false if r <= 0 || r > 8

    true
  end

  def ==(other)
    other.is_a?(self.class) &&
      other.file == @file &&
      other.rank == @rank
  end

  alias eql? ==

  def hash
    [self.class, @file, @rank].hash
  end
end
