class ReviewsController < ApplicationController
   before_action :set_movie

  #This is the index method of Reviews
  def index
	 
    @reviews = @movies.reviews
  end

  def new
 
  @reviews = @movies.reviews.new
end

def create

  @reviews = @movies.reviews.new(review_params)
  if @reviews.save
    redirect_to movie_reviews_path(@movies), 
                  notice: "Thanks for your review!"
  else
    render :new
  end
end

private

def set_movie
  @movies = Movie.find(params[:movie_id])
end

def review_params
  params.require(:review).permit(:name, :comment, :stars)
end
  

end
