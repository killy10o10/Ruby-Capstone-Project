module ListMovie
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
end
