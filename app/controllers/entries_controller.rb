class EntriesController < ApplicationController
  before_action :signed_in_user only: [:create, :destroy]
  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @comments = @entry.comments.paginate(:per_page => 10, :page => params[:comment])
    @comment = @entry.comments.create if signed_in?
  end

  def index
  end

  def destroy
  end

  private

    def entry_params
      params.require(:entry).permit(:title, :body)
    end


end