class Api::V1::BooksController < ApplicationController 
before_action :load_book, only: :show

def index 
    @books = Book.all.includes(:reviews)
    books_serializer = parse_json @books
    json_response "Index books successfully", true, {books: books_serializer}, :ok
end

def show 
    books_serializer = parse_json @book
    json_response "Show book successfully", true, {book: books_serializer}, :ok
end 

private 

    def load_book
        @book = Book.find_by id: params[:id]
        unless @book.present?
            json_response "Cannot get book", false, {}, :not_found
            
        end
    end 
end 