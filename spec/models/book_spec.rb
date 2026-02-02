require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(
      title: "title",
      author: "author",
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).to be_valid
  end

  it "is valid with an author" do
    book = Book.new(
      title: "title",
      author: "author",
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).to be_valid
  end

  it "is valid with a price" do
    book = Book.new(
      title: "title",
      author: "author",
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).to be_valid
  end

  it "is valid with a publish date" do
    book = Book.new(
      title: "title",
      author: "author",
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(
      title: nil,
      author: "author",
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "is invalid without an author" do
    book = Book.new(
      title: "title",
      author: nil,
      price: 1.00,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).not_to be_valid
    expect(book.errors[:author]).to include("can't be blank")
  end

  it "is invalid without a price" do
    book = Book.new(
      title: "title",
      author: "author",
      price: nil,
      publish_date: Date.new(1970, 1, 1)
    )
    book.valid?
    expect(book).not_to be_valid
    expect(book.errors[:price]).to include("can't be blank")
  end

  it "is invalid without a publish date" do
    book = Book.new(
      title: "title",
      author: "author",
      price: 1.00,
      publish_date: nil
    )
    book.valid?
    expect(book).not_to be_valid
    expect(book.errors[:publish_date]).to include("can't be blank")
  end
end
