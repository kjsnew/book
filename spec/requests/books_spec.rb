require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "POST /books" do
    context "with valid parameters" do
      it "adds a book and sets flash notice" do
        expect { post "/books", params: {
          book: {
            title: "title",
            author: "author",
            price: 1.00,
            publish_date: "1970-01-01"
          }
        } }.to change(Book, :count).by(1)
        expect(Book.last.title).to eq("title")
        expect(Book.last.author).to eq("author")
        expect(Book.last.price).to eq(1.00)
        expect(Book.last.publish_date).to eq(Date.new(1970, 1, 1))
        follow_redirect!
        expect(response.body).to include("Book was successfully created")
      end
    end

    context "with invalid title" do
      it "does not add a book and shows flash alert" do
        book_params = {
          title: nil,
          author: "author",
          price: 1.00,
          publish_date: "1970-01-01"
        }
        post "/books", params: { book: book_params }
        # expect(Book.count).to eq(0)
        # expect(response.body).to include("Title can&#39;t be blank")
        expect { post "/books", params: { book: book_params } }.not_to change(Book, :count)
        expect(response.body).to include("Title can&#39;t be blank")
      end
    end

    context "with invalid author" do
      it "does not add a book and shows flash alert" do
        book_params = {
          title: "title",
          author: nil,
          price: 1.00,
          publish_date: "1970-01-01"
        }
        expect { post "/books", params: { book: book_params } }.not_to change(Book, :count)
        expect(response.body).to include("Author can&#39;t be blank")
      end
    end

    context "with invalid price" do
      it "does not add a book and shows flash alert" do
        book_params = {
          title: "title",
          author: "author",
          price: nil,
          publish_date: "1970-01-01"
        }
        expect { post "/books", params: { book: book_params } }.not_to change(Book, :count)
        expect(response.body).to include("Price is not a number")
        # expect(response.body).to include("")
      end
    end

    context "with invalid publish_date" do
      it "does not add a book and shows flash alert" do
        book_params = {
          title: "title",
          author: "author",
          price: 1.00,
          publish_date: "chicken adobo"
        }
        expect { post "/books", params: { book: book_params } }.not_to change(Book, :count)
        expect(response.body).to include("Publish date can&#39;t be blank")
      end
    end
  end
end
