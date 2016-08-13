class EventItem
  include Listable
  attr_reader :description, :start_date, :end_date
  @@items = []

  def initialize(description, options={})
    @description = description
    if (options[:end_date] && !options[:start_date])
      raise UdaciListErrors::InvalidDateError.new, 'Invalid date entry: cannot enter end_date without start_date.'.magenta
    end
    @start_date = Chronic.parse(options[:start_date]).to_s if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]).to_s if options[:end_date]
    @@items << self
  end
  def details
    format_description(@description) + "Event dates: " + 
    format_date(options = {type: "event", start_date: @start_date, end_date: @end_date})
  end
  def self.all
    @@items
  end
end