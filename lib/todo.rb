class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]).to_s : options[:due]
    @priority = options[:priority]
  end
  def details
    format_description(@description) + "due: " + 
    format_date(options = {due: @due}) + format_priority(@priority)
  end
end
