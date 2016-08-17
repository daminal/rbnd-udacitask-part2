class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type
  @@todos = []

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]).to_s : options[:due]
    @priority = options[:priority]
    @type = "todo"
    @@todos << self
  end
  def details
    format_date + format_priority(@priority)
  end
  def self.all
    @@todos
  end
end
