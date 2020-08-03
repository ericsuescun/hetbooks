require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Discipline", with: @book.discipline
    fill_in "Edition", with: @book.edition
    fill_in "Index", with: @book.index
    fill_in "Isbn 10", with: @book.isbn_10
    fill_in "Isbn 13", with: @book.isbn_13
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "Pub year", with: @book.pub_year
    fill_in "Size", with: @book.size
    fill_in "Speciality2", with: @book.speciality2
    fill_in "Specialty", with: @book.specialty
    fill_in "Title", with: @book.title
    fill_in "Topic", with: @book.topic
    fill_in "Volumes", with: @book.volumes
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Discipline", with: @book.discipline
    fill_in "Edition", with: @book.edition
    fill_in "Index", with: @book.index
    fill_in "Isbn 10", with: @book.isbn_10
    fill_in "Isbn 13", with: @book.isbn_13
    fill_in "Pages", with: @book.pages
    fill_in "Price", with: @book.price
    fill_in "Pub year", with: @book.pub_year
    fill_in "Size", with: @book.size
    fill_in "Speciality2", with: @book.speciality2
    fill_in "Specialty", with: @book.specialty
    fill_in "Title", with: @book.title
    fill_in "Topic", with: @book.topic
    fill_in "Volumes", with: @book.volumes
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
