require './app'

class Main
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to the App'
    loop do
      list_options
      option = gets.chomp.to_i
      options(option)
      if option == 14
        puts 'Goodbye'
        break
      end
    end
  end

  def list_options
    puts '
    1. List all books
    2. List all labels
    3. Add a book
    4. List all music albums
    5. List all genres
    6. Add a music album
    7. List of games
    8. List all authors
    9. Add a game
    10. Add author
    11. List all movies
    12. List all sources
    13. Add a movie
    14. Exit
    '
  end

  def options(option)
    case option
    when 7
      @app.list_all_games
    when 8
      @app.list_all_authors
    when 9
      @app.add_game
    when 10
      @app.add_author
    end
  end
end

main = Main.new
main.start
