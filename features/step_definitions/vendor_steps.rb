When /^I upload a vendor package called "([^"]*)"$/ do |vendor|
  step %{I go to the vendor upload page}
  path = Rails.root.join("spec", "resources", "vendors", vendor)
  attach_file("Package", path)
  click_button "Upload"
end

Then /^I should see the vendor upload form$/ do
  page.has_css? selector_for("the vendor upload form")
end
