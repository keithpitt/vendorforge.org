When /^I upload a vendor package called "([^"]*)"$/ do |vendor|
  step %{I go to the vendor upload page}
  path = Rails.root.join("spec", "resources", "vendors", vendor)
  attach_file("Package", path)
  click_button "Upload"
end

Then /^I should see the vendor upload form$/ do
  page.has_css? selector_for("the vendor upload form")
end

When /^I delete the vendor called "([^"]*)"$/ do |vendor|
  visit path_to(%{the "#{vendor}" vendor page})

  click_link "Delete Version"
end

Then /^I shouldn't be able to delete the vendor called "([^"]*)"$/ do |vendor|
  visit path_to(%{the "#{vendor}" vendor page})

  page.should_not have_css(".delete-version-button")
end
