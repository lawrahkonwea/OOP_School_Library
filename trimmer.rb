require_relative 'decorator'

class Trimmer < Decorator
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0..9]
  end
end
