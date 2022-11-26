require_relative './movie'
require_relative '../sources/source_methods'
require 'json'

module MovieMethods
  def create_movie
    print 'Published date: '
    publish_date = gets.chomp
    print 'Movie is silent? [y/n]: '
    silent = gets.chomp.upcase == 'y' || 'Y'
    print 'Source name: '
    source_name = gets.chomp
    source = Source.new(source_name)
    movie = Movie.new(source, publish_date, silent)
    @movies << movie
    @sources << source
    save_movie
    save_source
    puts 'Movie added successfully'
  end

  def list_movie
    puts 'List of all movie:'
    puts 'No movie recorded yet.' if @movies.empty?
    @movies.each do |movie|
      puts "Published date: #{movie.publish_date}"
      puts "Silent: #{movie.silent}"
      puts "Source: #{movie.source.name}"
    end
    puts '----------'
  end

  def save_movie
    return if @movies.empty?

    file = './storage/movies.json'
    File.new(file, 'w+') unless File.exist?(file)

    data = []

    @movies.each do |movie|
      data << {
        movie_source_id: movie.source.id,
        movie_source_name: movie.source.name,
        silent: movie.silent,
        publish_date: movie.publish_date
      }
    end
    File.write(file, JSON.generate(data))
  end

  def load_all_movies
    data = []
    file = './storage/movies.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |movie|
      source = Source.new(movie['movie_source_name'])
      movie = Movie.new(source, movie['publish_date'], movie['silent'])
      data << movie
    end
    data
  end
end
