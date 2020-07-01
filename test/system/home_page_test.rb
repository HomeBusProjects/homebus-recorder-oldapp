class HomePageTest < ApplicationSystemTestCase
  test "show homepage" do
    visit "/samples"
    assert_text "Samples"
  end
end
