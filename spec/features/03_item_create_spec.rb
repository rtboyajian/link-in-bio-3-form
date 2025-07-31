require "rails_helper"

describe "/backdoor" do
  it "has a form", :points => 1 do
    visit "/backdoor"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/backdoor" do
  it "has a label for 'Link URL' with text: 'Link URL'", :points => 1, hint: h("copy_must_match label_for_input") do
    visit "/backdoor"

    expect(page).to have_css("label", text: "Link URL")
  end
end

describe "/backdoor" do
  it "has at least one input elements", :points => 1, hint: h("label_for_input") do
    visit "/backdoor"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/backdoor" do
  it "has a button with text 'Create item'", :points => 1, hint: h("copy_must_match") do
    visit "/backdoor"

    expect(page).to have_css("button", text: "Create item")
  end
end

describe "/backdoor" do
  it "creates an Item when 'Create item' form is submitted", :points => 5, hint: h("button_type") do
    initial_number_of_items = Item.count
    test_url = "https://en.wikipedia.org/wiki/Frog"

    visit "/backdoor"

    fill_in "Link URL", with: test_url
    click_on "Create item"
    final_number_of_items = Item.count
    expect(final_number_of_items).to eq(initial_number_of_items + 1)
  end
end
