require 'spec_helper'

describe Change do
  selector = "ul#hhh0 li:nth-of-type(5) a.swp span.txt"
  it "should creates a new change" do
    change_count = Change.count
    Change.create(:selector => selector)
    Change.count.should eq(change_count + 1)
  end

  it "should add the selector checksum" do
    change = Change.create(:selector => selector)
    change.selector_checksum.should eq("2fca76b6b9057506")
  end

  it "should add a change to a page" do
    page = FactoryGirl.create(:page)
    change = FactoryGirl.create(:change)
    page.changes << change
    page.changes.first.should eq(change)
  end

  it "should find change by page_id and selector" do
    page = FactoryGirl.create(:page)
    change = FactoryGirl.create(:change)
    page.changes << change
    Change.find_or_create_by_page_id_and_selector(page.id, change.selector).should eq(change)
  end
end
