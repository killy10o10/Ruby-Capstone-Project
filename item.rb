require 'date'

class Item
  attr_accessor :publish_date, :id, :archived
  attr_reader :author, :source, :genre, :label

  def initialize(publish_date, id = Random.rand(1..1000), archived: false)
    @id = id
    @publish_date = Date.parse(publish_date)
    @archived = archived
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
    ten_years_ago = Date.today.year - @publish_date.year
    ten_years_ago > 10
  end
  private :can_be_archived?

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
