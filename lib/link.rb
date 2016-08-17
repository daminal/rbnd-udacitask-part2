class LinkItem
  include Listable
  attr_reader :description, :site_name, :type
  @@links = []

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name] ? options[:site_name] : "None"
    @type = "link"
    @@links << self
  end
  def details
    "Site name: " + @site_name
  end
  def self.all
    @@links
  end
end
