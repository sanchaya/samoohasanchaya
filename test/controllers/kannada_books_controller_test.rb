require 'test_helper'

class KannadaBooksControllerTest < ActionController::TestCase
  setup do
    @kannada_book = kannada_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kannada_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kannada_book" do
    assert_difference('KannadaBook.count') do
      post :create, kannada_book: { author: @kannada_book.author, book_link: @kannada_book.book_link, library: @kannada_book.library, name: @kannada_book.name, publisher: @kannada_book.publisher }
    end

    assert_redirected_to kannada_book_path(assigns(:kannada_book))
  end

  test "should show kannada_book" do
    get :show, id: @kannada_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kannada_book
    assert_response :success
  end

  test "should update kannada_book" do
    patch :update, id: @kannada_book, kannada_book: { author: @kannada_book.author, book_link: @kannada_book.book_link, library: @kannada_book.library, name: @kannada_book.name, publisher: @kannada_book.publisher }
    assert_redirected_to kannada_book_path(assigns(:kannada_book))
  end

  test "should destroy kannada_book" do
    assert_difference('KannadaBook.count', -1) do
      delete :destroy, id: @kannada_book
    end

    assert_redirected_to kannada_books_path
  end
end
