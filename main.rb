require_relative 'app'

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
      if option == 13
        puts 'Goodbye'
        break
      end
    end
  end

  def list_options
    puts '1. List all books'
    puts '2. List all labels'
    puts '3. Add a book'
    puts '4. List all music albums'
    puts '5. List all genres '
    puts '6. Add a music album'
    puts '7. List of games'
    puts '8. List all authors'
    puts '9. Add a game'
    puts '10. List all movies'
    puts '11. List all sources'
    puts '12. Add a movie'
    puts '13. Exit'
  end

  def options(option)
    case option
      when 12
        @app.add_item
      when 10
        @app.list_movie
      when 11
        @app.list_source
      end
    end
end

main = Main.new
main.start
