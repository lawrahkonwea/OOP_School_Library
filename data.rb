require 'json'
require_relative './book'
require_relative './person'
require_relative './rental'

PATH = './data/'.freeze
class Data
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def load_books
    return [] unless File.size?("#{PATH}book.json")

    stored_books = JSON.parse(File.read("#{PATH}book.json"))
    stored_books.map do |book|
      @books << Book.new(book['id'], book['title'], book['author'])
    end
    @books
  end

  def create_book(book)
    if File.size?("#{PATH}book.json")
      stored_books = JSON.parse(File.read("#{PATH}book.json"))
      stored_books << { id: book.id, title: book.title, author: book.author }
      File.write("#{PATH}book.json", JSON.pretty_generate(stored_books))
    else
      File.write("#{PATH}book.json", JSON.pretty_generate([{ id: book.id, title: book.title, author: book.author }]))
    end
  end
end
