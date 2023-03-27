require_relative './app'

class Menu
  def initialize(app)
    @app = app
  end

  def display_menu # rubocop:disable Metrics/CyclomaticComplexity
    loop do
      menu
      input = user_input
      case input
      when 1 then @app.list_books
      when 2 then @app.list_people
      when 3 then @app.create_person
      when 4 then @app.create_book
      when 5 then @app.create_rental
      when 6 then @app.list_rentals
      when 7 then break
      end
    end
  end

  private

  def menu
    puts 'Choose your option by entering a number:'
    puts '1 - List all Books.'
    puts '2 - List all People.'
    puts '3 - Create a Person.'
    puts '4 - Create a Book.'
    puts '5 - Create a Rental.'
    puts '6 - List all rentals for a given person id.'
    puts '7 - Exit'
  end

  def user_input
    input = gets.chomp.to_i
    while input > 7 || input < 1
      puts 'Please enter a valid option between 1 to 7: '
      input = gets.chomp.to_i
    end
    input
  end
end

def main
  app = App.new
  puts "\nWelcome to the School Library!\n\n"
  display_menu(app)
end

main
