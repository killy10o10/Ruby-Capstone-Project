require './author'
require './game'

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
    author = Author.new(first_name, last_name)
    @authors.push(author)
  end

  def list_all_authors
    Author.list_all(@authors)
  end

  def add_game
    print "What's the last played date? (Enter in format ➡ [YYYY-MM-DD]): "
    last_played_at = gets.chomp
    print "What's the publishing date? (Enter in format ➡ [YYYY-MM-DD]): "
    published_date = gets.chomp
    multiplayer = Game.multiplayer?
    game = Game.new(published_date, last_played_at, multiplayer: multiplayer)
    @games.push(game)
  end

  def list_all_games
    Game.list_all_games(@games)
  end
end
