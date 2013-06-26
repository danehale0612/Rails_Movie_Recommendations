Given(/^the user "(.*?)" with password "(.*?)"$/) do |email, password|
  user = User.create( email: email, password: password)
  refute user.new_record?
end

When(/^I go to the homepage$/) do
  visit "/"
end

When "show me the page" do
  save_and_open_page
end

When(/^I (?:click|press) "(.*?)"$/) do |text|
  click_link_or_button text
end

When(/^I fill in "(.*?)" for "(.*?)"$/) do |value, field_named|
  fill_in field_named, with: value
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

Then(/^I should not see "(.*?)"$/) do |arg1|
  should_not have_content arg1
end

Then(/^I click link "(.*?)"$/) do |arg1|
  first("a", text: arg1).click
end

Then(/^I click image$/) do
  find('#PredatorPoster').click
end

When(/^I sign in as "(.*?)" with "(.*?)"$/) do |email, password|
  click_link_or_button "sign in"
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_link_or_button "Sign in"
end

Then(/^I go to "(.*?)" recommendations$/) do |title|
  click_link_or_button "Recommend Movies"
  fill_in "Search Recommendation", with: title
  click_link_or_button "Get Recommendations"
end

Then(/^I go to "(.*?)"$/) do |list|
  click_link_or_button "Go To User Screen"
  click_link_or_button list
end

Then(/^I go into "(.*?)" to "(.*?)"$/) do |title, action|
  first("a", text: "1) Predator").click
  click_link_or_button action
end




