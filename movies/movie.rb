require_relative '../item'
require_relative '../sources/source'

class Movie < Item
  attr_accessor :publish_date, :archived, :silent

  def initialize(source, publish_date, silent)
    super publish_date
    @silent = silent
    add_source(source)
  end

  def can_be_archived?
    super || @silent ? true : false
  end
end
