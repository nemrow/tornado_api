class Page < ActiveRecord::Base
  attr_accessible :url, :url_checksum

  before_save :save_checksum

  has_many :changes

  def save_checksum
    self.url_checksum = Utils.create_checksum(url)
  end

  def self.find_by_url(url)
    Page.find_by_url_checksum(Utils.create_checksum(url))
  end

  def find_or_create_by_url(url)
    Page.find_or_create_by_url_checksum(Utils.create_checksum(url))
  end
end
