require_relative './books/book_methods'
require_relative './books/book'
require_relative './games/game_methods'
require_relative './games/game'
require_relative './authors/author_methods'
require_relative './authors/author'
require_relative './labels/label'
require_relative './labels/label_methods'
require_relative './genres/genre'
require_relative './genres/genre_methods'
require_relative './music_albums/music_album'
require_relative './music_albums/music_album_methods'
require_relative './movies/movie_methods'
require_relative './sources/source_methods'
require 'io/console'

require 'json'
require './retrieve_data'
require './data'

class App
  def initialize
    @books = load_all_books
    @labels = load_all_labels
    @genres = load_all_genres
    @games = load_all_games
    @music_albums = load_all_music_albums
    @movies = load_all_movies
    @sources = load_all_sources
  end

  include BookMethods
  include LabelMethods
  include GameMethods
  include AuthorMethods
  include GenreMethods
  include MusicAlbumMethods
  include MovieMethods
  include SourceMethods

  def run
    print "⭐️ Welcome to the Catalog of my Things! ⭐️ \n\n"
    loop do
      puts "🔸Please choose an option by entering a number: \n
      1 - List all books
      2 - List all music albums
      3 - List of games
      4 - List all genres (e.g 'Comedy', 'Thriller')
      5 - List all labels (e.g. 'Gift', 'New')
      6 - List all authors (e.g. 'Stephen King')
      7 - Add a book
      8 - Add a music album
      9 - Add a game
      10 - Add a movie
      11 - List all movies
      12 - List all sources
      13 - Exit"
      option = gets.chomp.to_i
      break if option == 13

      list_all_items(option)
    end
  end

  def options(_option)
    system('clear')
  end

  def invalid_option()
    puts 'Invalid option. Please press any key to continue...'
    $stdin.getch
    system('clear')
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def list_all_items(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_music_albums
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_authors
    when 7
      create_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      create_movie
    when 11
      list_movie
    when 12
      list_source
    end
    print "\nPress Enter/Return to Continue..."
    $stdin.getch
    system('clear')
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
