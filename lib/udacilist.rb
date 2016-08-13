class UdaciList
  attr_reader :title, :items
  def initialize(options={title: "Untitled List"})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    begin
      if type == "todo"
        @items.push TodoItem.new(description, options)
      elsif type == "event"
        @items.push EventItem.new(description, options) 
      elsif type == "link"
        @items.push LinkItem.new(description, options)
      else 
        raise UdaciListErrors::InvalidItemType.new, 'Invalid list item type.'
      end
    end
    rescue StandardError => e
      puts "#{e.class}: #{e.message}"
  end
  def delete(index)
    begin
      if index.next > @items.count
        raise UdaciListErrors::IndexExceedsListSize.new, 'The index exceeds the list size.'
      else
        @items.delete_at(index - 1)
      end
    end
    rescue StandardError => e
    puts "#{e.class}: #{e.message}"      
  end
  def all
    puts "-" * @title.length
    puts @title 
    puts "-" * @title.length
    if @items.empty?
      puts "This list is empty." 
    else
      @items.each_with_index do |item, position|
        puts "#{position + 1}) #{item.details}"
      end
    end
  end
  def filter(type)
    puts "-" * @title.length
    puts "#{@title}: #{type.capitalize}s"
    puts "-" * @title.length
    selections = LinkItem.all if type == "link"
    selections = EventItem.all if type == "event"
    selections = TodoItem.all if type == "todo"
    selections.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end

