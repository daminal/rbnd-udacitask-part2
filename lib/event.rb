class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date, :type
  @@items = []

  def initialize(description, options={})
    @description = description
    @type = 'event'
    @start_date = Chronic.parse(options[:start_date]).to_s if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]).to_s if options[:end_date]
    @@items << self
  end
  def details
    format_date
  end
  def self.all
    @@items
  end
end