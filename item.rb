require 'date'

class Item
  attr_accessor :publish_date, :author, :source, :genre, :label, :id
  attr_reader :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
    # 1-to-many relationships
    @author = 'unknown'
    @source = 'unknown'
    @label = 'unknown'
    @genre = 'unknown'
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def can_be_archived?
    ten_years_ago = time.now.year - @publish_date.year
    ten_years_ago > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
