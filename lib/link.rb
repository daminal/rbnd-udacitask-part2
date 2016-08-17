class LinkItem
  include Listable
  attr_reader :description, :site_name, :type
  @@items = []

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name] ? options[:site_name] : "None"
    @type = "link"
    @@items << self
  end
  def details
    "Site name: " + @site_name
  end
  def self.all
    @@items
  end
end
