class SearchController < ApplicationController

  def search
    keyword = params[:keyword]
    @range = params[:range]
    @part = params[:part]

    if @range == "User"
      @users = User.search(@part, keyword)
    else
      @books = Book.search(@part, keyword)
    end

  end
end