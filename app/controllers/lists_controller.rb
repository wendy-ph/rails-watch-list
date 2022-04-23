class ListsController < ApplicationController
  def index
    @lists = List.order(name: :asc)
    @new_list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks

    # @list.movies[0].poster_url
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  # def find_bookmark
  #   @bookmarks = []
  #   # @bookmarks = Bookmark.find(@list.bookmark_ids[0])
  #   @list.bookmark_ids.each do |id|
  #     bookmark = Bookmark.find(id)
  #     @bookmarks << bookmark
  #   end
  #   @bookmarks
  # end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
