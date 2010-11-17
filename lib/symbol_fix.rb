# this seems to stem from a bug in the interpreter

class Symbol
  include Comparable

  def <=>(other)
    self.to_s <=> other.to_s
  end
end