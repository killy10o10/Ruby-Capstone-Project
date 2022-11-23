require 'author'
require 'game'

class App
  attr_reader :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_author
    print "Author's first name: "
    first_name = gets.chomp
    print "Author's last name: "
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def list_all_authors
    Author.list_all(@authors)
  end
end
