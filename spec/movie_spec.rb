require_relative '../movie'

describe Source do
    context 'When create a new movie' do
        it 'return a new object' do
            movie = Movie.new('2022', true)
            expect(movie).to be_an_instance_of(Movie)
        end
        it 'return the correct silet' do
            movie = Movie.new('2022', true)
            expect(movie.silet).to eql(true)
        end
        it 'return the possiblity of archiving the item ' do
            movie = Movie.new('2022', false)
            expect(movie.can_be_archived?).to eql(false)
        end
    end
end