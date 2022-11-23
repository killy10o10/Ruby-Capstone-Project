class Author
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def list_all(authors)
    if authors.empty?
      puts 'Seem like there are no authors on your list😅, Add some authors...'
    else
      puts "Authors list, count(#{authors.count})👤 :\n\n "
      authors.each_with_index do |author, index|
        puts "#{index + 1}) Author: #{author.first_name}, #{author.last_name}"
      end
    end
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end
