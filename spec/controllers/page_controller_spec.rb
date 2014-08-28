require 'spec_helper'

describe Api::V1::PageController do
  before(:each) do
    @page = FactoryGirl.create(:page)
    ["ul li:nth-of-type(2)", "div.test p"].each do |selector|
      change = Change.create(:selector => selector, :content => "this is some new content", :content_type => "text")
      @page.changes << change
    end
  end

  context "post is sent to /api/v1/page/show" do
    it "get all changes for that pages url" do
      post :show, :url => "http://sfbay.craigslist.org/"
      JSON.parse(response.body).count.should eq(@page.changes.count)
    end
  end
end


