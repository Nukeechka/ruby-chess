# frozen_string_literal:true

# class Move
class Move
  attr_reader :from, :to

  def initialize(from, to)
    @from = from
    @to = to
  end
end
