class UdaciList
  attr_reader :title, :items
  @@types = ['todo', 'event', 'link']

  def initialize(options={title: 'Untitled List'})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type.downcase!
    @items.push TodoItem.new(description, options) if type == 'todo'
    @items.push EventItem.new(description, options) if type == 'event'
    @items.push LinkItem.new(description, options) if type == 'link'
    unless @@types.include?(type) 
      raise UdaciListErrors::InvalidType.new, 'Invalid item type.'.magenta
    end
    rescue StandardError => e
      puts "#{e.class}: #{e.message}"
  end
  def delete(index)
    begin
      if index.next > @items.count
        raise UdaciListErrors::IndexExceedsListSize.new, 'The index exceeds the list size.'.magenta
      else
        @items.delete_at(index - 1)
      end
    end
    rescue StandardError => e
    puts "#{e.class}: #{e.message}"      
  end
  def print(table)
    puts table
  end
  def headings
    ['', 'Type', 'Details']
  end
  def items (options = {})
    rows = []
    items = options[:filter]? @items.select{|item| item.type == options[:filter]} : @items
    if items.empty?
      rows << ['This list is empty.'] 
    else
      items.each_with_index do |item, position|
        rows << ["#{position + 1}. #{item.description}", item.type, item.details]
      end
    end
    return rows
  end
  def all(options = {})
    title = options[:filter] ? @title + ': ' + options[:filter].capitalize + 's' : @title
    table = Terminal::Table.new title: title, headings: headings(), rows: items(options) 
    print(table)
  end
  def filter(type)
    unless @@types.include?(type)
      raise UdaciListErrors::InvalidType, 'Invalid item type.'.magenta
    end
    all(filter: type)
  end
end

