When /^I upload a vendor package called "([^"]*)"$/ do |vendor|
  path = Rails.root.join("spec", "resources", "vendors", vendor)

  puts path.inspect

  attach_file("Package", path)

  click_button "Upload"
end

Then /^I should see the vendor upload form$/ do
  pending # express the regexp above with the code you wish you had
end
