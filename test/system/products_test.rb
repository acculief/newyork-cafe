require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    fill_in "Comment Count", with: @product.comment_count
    fill_in "Dislike Count", with: @product.dislike_count
    fill_in "Favorite Count", with: @product.favorite_count
    fill_in "Like Count", with: @product.like_count
    fill_in "Products Url", with: @product.products_url
    fill_in "Title", with: @product.title
    fill_in "View Count", with: @product.view_count
    fill_in "Youtuber", with: @product.youtuber_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Comment Count", with: @product.comment_count
    fill_in "Dislike Count", with: @product.dislike_count
    fill_in "Favorite Count", with: @product.favorite_count
    fill_in "Like Count", with: @product.like_count
    fill_in "Products Url", with: @product.products_url
    fill_in "Title", with: @product.title
    fill_in "View Count", with: @product.view_count
    fill_in "Youtuber", with: @product.youtuber_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
