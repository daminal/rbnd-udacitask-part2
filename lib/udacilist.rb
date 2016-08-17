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
  def print_table(table)
    puts table
  end
  def headings
    ['', 'Type', 'Details']
  end
  def items
    rows = []
    if @items.empty?
      rows << ['This list is empty.'] 
    else
      @items.each_with_index do |item, position|
        rows << ["#{position + 1} #{item.details}"]
      end
    end
    return rows
  end
  def all
    rows = []
    table = Terminal::Table.new title: @title, headings: headings(), rows: items() 
    print_table(table)
  end
  def selection(type)
    unless @@types.include?(type)
      raise UdaciListErrors::InvalidType, 'Invalid item type.'.magenta
    end
    selections = LinkItem.all if type == 'link'
    selections = EventItem.all if type == 'event'
    selections = TodoItem.all if type == 'todo'
    unless selections.any?
      raise UdaciListErrors::NoItemsError, 'This list contains no items of this type.'.magenta
    else
      return selections
    end
  end
  def filter(type)
    rows = []
    rows << ["-" * @title.length]
    rows << ["#{@title}: #{type.downcase.capitalize}s"]
    rows << ["-" * @title.length]
    selection(type).each_with_index do |item, position|
      rows << ["#{position + 1}) #{item.details}"]
    end
    print_table(rows)
  end
end

