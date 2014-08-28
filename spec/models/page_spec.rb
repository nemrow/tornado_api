require 'spec_helper'

describe Page do
  it "create a new page" do
    page_count = Page.count
    Page.create(:url => "http://sfbay.craigslist.org/")
    Page.count.should eq(page_count + 1)
  end

  it "should create a checksum" do
    page = Page.create(:url => "http://sfbay.craigslist.org/")
    page.url_checksum.should eq("ad1706731c138951")
  end

  it "should find the page" do
    url = "http://sfbay.craigslist.org/"
    page = Page.create(:url => url)
    Page.find_by_url(url).should eq(page)
  end
end
