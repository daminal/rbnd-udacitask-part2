class TodoItem
  include Listable
  attr_reader :description, :due, :priority
  @@todos = []

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]).to_s : options[:due]
    @priority = options[:priority]
    @@todos << self
  end
  def details
    format_description(@description) + "Due: " + 
    format_date(options = {type: "todo", due: @due}) + format_priority(@priority)
  end
  def self.all
    @@todos
  end
end
