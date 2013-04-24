class BooksigningsController < ApplicationController

  def index
    @books = Booksigning.all
  end

end
