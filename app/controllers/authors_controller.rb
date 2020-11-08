class AuthorsController < ApplicationController
  def show
    @user = current_user
    @author = Author.find(params[:id])
  end

  def new
    @user = current_user
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author was added to database!"
      redirect_to author_path(@author)
    else
      flash.now.alert = "Something went wrong. Please try again"
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :birth_date, :nationality)
  end
end
