require_relative 'movie'
require_relative 'source'
class App
    attr_reader :sources, :movies

    def initialize
        @sources = []
        @movies = []
    end

    def add_item
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

    def list_source
        puts ''
        puts 'List of all sources:'
        puts ''
        if @sources.empty?
          puts 'No sources recorded yet.'
          return
        end
        @sources.each do |source|
          puts "Source name: #{source.name}"
          puts "Source ID: #{source.id}"
        end
        puts ''
    end
end