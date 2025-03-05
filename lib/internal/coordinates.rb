# frozen_string_literal: true

# class Coordinates
class Coordinates
  attr_accessor :file, :rank

  def initialize(file, rank)
    @file = file
    @rank = rank
  end

  def ==(other)
    other.is_a?(self.class) &&
      other.file == @file &&
      other.title == @title
  end

  alias eql? ==

  def hash
    [self.class, @file, @rank].hash
  end
end
