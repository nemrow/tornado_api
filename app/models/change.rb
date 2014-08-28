class Change < ActiveRecord::Base
  attr_accessible :content, :content_type, :selector, :selector_checksum, :page_id

  before_save :save_checksum

  belongs_to :page

  def save_checksum
    self.selector_checksum = Utils.create_checksum(selector)
  end

  def self.find_or_create_by_page_id_and_selector(page_id, selector)
    selector_checksum = Utils.create_checksum(selector)
    Change.find_or_create_by_page_id_and_selector_checksum(:page_id => page_id, :selector_checksum => selector_checksum, :selector => selector)
  end
end
