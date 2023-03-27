# $LOAD_PATH.unshift('/path/to/decorator')
require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
