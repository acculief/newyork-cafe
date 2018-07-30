require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { comment_count: @product.comment_count, dislike_count: @product.dislike_count, favorite_count: @product.favorite_count, like_count: @product.like_count, products_url: @product.products_url, title: @product.title, view_count: @product.view_count, youtuber_id: @product.youtuber_id } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { comment_count: @product.comment_count, dislike_count: @product.dislike_count, favorite_count: @product.favorite_count, like_count: @product.like_count, products_url: @product.products_url, title: @product.title, view_count: @product.view_count, youtuber_id: @product.youtuber_id } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
