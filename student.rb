require './person'

class Student < person
  def initialize(*args, classroom)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
