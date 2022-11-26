require_relative '../movies/movie'
require_relative '../sources/source'

describe Movie do
  context 'When create a new movie' do
    it 'return a new object' do
      source = Source.new('Netflix')
      movie = Movie.new(source, '2022', true)
      expect(movie).to be_an_instance_of(Movie)
    end
    it 'return the correct silet' do
      source = Source.new('Netflix')
      movie = Movie.new(source, '2022', true)
      expect(movie.silent).to eql(true)
    end
    it 'return the possiblity of archiving the item ' do
      source = Source.new('Netflix')
      movie = Movie.new(source, '2022-08-06', false)
      expect(movie.can_be_archived?).to eql(false)
    end
  end
end
