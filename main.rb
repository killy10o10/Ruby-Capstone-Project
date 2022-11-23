class Main
  def start
    puts 'Welcome to the App'
    loop do
      list_options
      option = gets.chomp.to_i
      if option == 13
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
    10. List all movies
    11. List all sources
    12. Add a movie
    13. Exit
    '
  end
end

main = Main.new
main.start
