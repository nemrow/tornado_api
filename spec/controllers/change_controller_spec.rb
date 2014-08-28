require 'spec_helper'

describe Api::V1::ChangeController do
  before(:each) do
    @page = FactoryGirl.create(:page, :url => "http://sfbay.craigslist.org/")
  end

  context "post is sent to /api/v1/change/create" do
    it "should add a new change to an existing page" do
      change_count = Change.count
      pages_changes_count = @page.changes.count
      pages_count = Page.count
      post :create, :url => "http://sfbay.craigslist.org/",
                    :selector => "ul#hhh0 li:nth-of-type(5) a.swp span.txt",
                    :content => "This is my changed text",
                    :content_type => "text"
      (change_count + 1).should eq(Change.count)
      pages_count.should eq(Page.count)
      (pages_changes_count + 1).should eq(@page.changes.count)
    end

    it "should add a new change to a new page" do
      change_count = Change.count
      pages_count = Page.count
      post :create, :url => "http://sfbay.craigslist.org/something_else",
                    :selector => "ul#hhh0 li:nth-of-type(5) a.swp span.txt",
                    :content => "This is my changed text",
                    :content_type => "text"
      (change_count + 1).should eq(Change.count)
      (pages_count + 1).should eq(Page.count)
      # JSON.parse(response.body)['response'].should eq(true)
    end
  end
end


