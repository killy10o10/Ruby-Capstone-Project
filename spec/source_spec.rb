require_relative '../source'

describe Source do
    context 'When create a new source' do
        it 'return a new object' do
            source = Source.new('Benjamin')
            expect(source).to be_an_instance_of(Source)
        end
        it 'return the correct date' do
            source = Source.new('Rafael Nadal')
            item = Item.new('2020')
            source.add_item(item)
            expect(source.items[0].publish_date).to eql('2020')
        end
    end
end
