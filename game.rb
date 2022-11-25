require 'date'
require './item'
require './author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :label, :author, :genre

  def initialize(*args, last_played_at, multiplayer: false)
    super(*args)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def self.list_all_games(games)
    if games.empty?
      puts 'Seem like your game list is empty 😅, add some games...'
    else
      puts "Games list, count (#{games.count})🎮 :\n\n"
      games.each do |game|
        puts "  Last Played: #{game.last_played_at}",
             "  Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
      end
    end
  end

  def self.multiplayer?
    print 'Is it a Multiplayer Game? [Y/N]:'
    multi = gets.chomp.downcase
    case multi
    when 'n'
      false
    when 'y'
      true
    else
      puts 'Incorrect choice, kindle enter \'y\', \'Y\' or \'n\', \'N\' 😊'
      multiplayer?
    end
  end

  private

  def can_be_archived?
    super and (Date.today.year - Date.parse(@last_played_at).year > 2)
  end
end
