require 'json'

def save_persons
  File.open('./data/person.json', 'w') do |file|
    persons = @people.each_with_index.map do |person, index|
      if person.instance_of?(Teacher)
        { class: person.class,
          name: person.name,
          age: person.age,
          specialization: person.specialization,
          index: index }
      else
        { class: person.class,
          name: person.name,
          age: person.age,
          classroom: person.classroom.label,
          parent_permission: person.parent_permission,
          index: index }
      end
    end
    file.write(JSON.pretty_generate(persons))
  end
end

def save_books
  File.open('./data/book.json', 'w') do |file|
    books = @books.each_with_index.map do |book, index|
      { title: book.title,
        author: book.author,
        index: index }
    end
    file.write(JSON.pretty_generate(books))
  end
end

def save_rentals
  File.open('./data/rental.json', 'w') do |file|
    rentals = @rentals.each_with_index.map do |rental, _index|
      { date: rental.date,
        book_index: @books.index(rental.book),
        person_index: @people.index(rental.person) }
    end
    file.write(JSON.pretty_generate(rentals))
  end
end