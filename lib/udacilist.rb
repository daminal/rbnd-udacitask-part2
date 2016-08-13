class UdaciList
  attr_reader :title, :items
  @@types = ['event', 'todo', 'link']
  
  def initialize(options={title: "Untitled List"})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(description, options) if type == "todo"
    @items.push EventItem.new(description, options) if type == "event"
    @items.push LinkItem.new(description, options) if type == "link"
    unless @@types.include?(type) 
      raise UdaciListErrors::InvalidItemType.new, 'Invalid list item type.'.magenta
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
  def print_table(rows)
    table = Terminal::Table.new :rows => rows
    puts table
  end
  def all
    rows = []
    rows << ["-" * @title.length]
    rows << [@title]
    rows << ["-" * @title.length]
    if @items.empty?
      rows << ["This list is empty."] 
    else
      @items.each_with_index do |item, position|
        rows << ["#{position + 1}) #{item.details}"]
      end
    end
    print_table(rows)
  end
  def selection(type)
    unless @@types.include?(type)
      raise UdaciListErrors::NoTypeError, 'There is no such item type.'.magenta
    end
    selections = LinkItem.all if type == "link"
    selections = EventItem.all if type == "event"
    selections = TodoItem.all if type == "todo"
    unless selections.any?
      raise UdaciListErrors::NoItemsError, 'This list contains no items of this type.'.magenta
    else
      return selections
    end
  end
  def filter(type)
    rows = []
    rows << ["-" * @title.length]
    rows << ["#{@title}: #{type.capitalize}s"]
    rows << ["-" * @title.length]
    selection(type).each_with_index do |item, position|
      rows << ["#{position + 1}) #{item.details}"]
    end
    print_table(rows)
  end
end

