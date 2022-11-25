require_relative './source'
require 'json'

module SourceMethods
  def list_source
    puts ''
    puts 'List of all sources:'
    puts ''
    if @sources.empty?
      puts 'No sources recorded yet.'
      return
    end
    @sources.each do |source|
      puts "From #{source.name}"
    end
    puts ''
  end

  def save_source
    return if @sources.empty?

    file = './storage/sources.json'
    File.new(file, 'w+') unless File.exist?(file)

    data = []

    @sources.each do |source|
      data << {
        source_id: source.id,
        source_name: source.name
      }
    end
    File.write(file, JSON.generate(data))
  end

  def load_all_sources
    data = []
    file = './storage/sources.json'
    return data unless File.exist?(file) && File.read(file) != ''

    JSON.parse(File.read(file)).each do |source|
      source = Source.new(source['source_name'])
      data << source
    end
    data
  end
end
