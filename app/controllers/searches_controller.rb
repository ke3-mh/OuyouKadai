class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]

    if @model == "user"
      @users = User.looks(params[:method], params[:word])
    else
      @books = Book.looks(params[:method], params[:word])
    end
  end
end
