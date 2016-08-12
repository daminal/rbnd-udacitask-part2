class LinkItem
  include Listable
  attr_reader :description, :site_name
  @@links = []

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name] ? options[:site_name] : "None"
    @@links << self
  end
  def format_name
    @site_name
  end
  def details
    format_description(@description) + "Site name: " + format_name
  end
  def self.all
    @@links
  end
end
