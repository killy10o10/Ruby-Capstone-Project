require_relative 'item'

class Source
    attr_reader :id
    attr_accessor :name, :items

    def initialize (name)
        @id = Random.rand(0..1000)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item unless @items.include?(item)
        item.source = self
    end
end

i1 = Item.new('2001')
i2 = Item.new('2007')
i3 = Item.new('2020')
i4 = Item.new('2022')
s = Source.new("Ben")
s.add_item(i1)
puts s.items
s.add_item(i2)
s.add_item(i3)
s.add_item(i4)
puts s.items[3].publish_date