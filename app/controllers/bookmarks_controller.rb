class BookmarksController < ApplicationController
  # before_action :set_list
  # before_action :set_bookmark, only: [:destroy]

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.id), notice: 'Bookmark was successfully removed.'
  end


  private

  # def set_list
  #   @list = List.find(params[:list_id])
  # end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
