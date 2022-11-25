require 'date'

class Item
  attr_accessor :publish_date, :author, :source, :genre, :label, :id
  attr_reader :archived

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    # # 1-to-many relationships
    # @author = author
    # @source = source
    # @label = label
    # @genre = genre
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.to_i > 10
  end
end

# i = Item.new('2003')
# puts i.can_be_archived?
