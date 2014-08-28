FactoryGirl.define do
  factory :page do
    url "http://sfbay.craigslist.org/"
  end

  factory :change do
    selector "ul#hhh0 li:nth-of-type(5) a.swp span.txt"
    content "This is a change"
    content_type "text"
  end
end
