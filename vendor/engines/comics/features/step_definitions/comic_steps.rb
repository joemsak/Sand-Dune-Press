Given /^I have no comics$/ do
  Comic.delete_all
end

Given /^I (only )?have comics titled "?([^\"]*)"?$/ do |only, titles|
  Comic.delete_all if only
  titles.split(', ').each do |title|
    Comic.create(:title => title)
  end
end

Then /^I should have ([0-9]+) comics?$/ do |count|
  Comic.count.should == count.to_i
end
