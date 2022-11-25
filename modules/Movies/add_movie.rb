require_relative '../movie'
require_relative '../source'

module AddMovie
  def add_movie
    print 'Published date: '
    publish_date = gets.chomp
    print 'Movie is silent? [y/n]: '
    silent = gets.chomp.upcase == 'y' || 'Y'
    print 'Source name: '
    source_name = gets.chomp
    source = Source.new(source_name)
    movie = Movie.new(source, publish_date, silent)
    @movies << movie
    puts 'Movie added successfully'
  end
end
