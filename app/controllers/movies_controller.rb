class MoviesController < ApplicationController
  
  #This is the index method of Movies
  def index
   # @movies=Movie.released
    @movies = Movie.all
  end  
  
  #This is the show method of Movies
  def show
  	@movies=Movie.find(params[:id])
  end

   #This is the new method of Movies
  def new
    @movies=Movie.new
  end

  #This is the create method of Movies
  def create 
    @movies=Movie.create(movie_params)
    if @movies.save
      redirect_to @movies, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  #This is the edit method of Movies
  def edit
   @movies=Movie.find(params[:id])
  end

  #This is the update method of Movies
  def update
    @movies=Movie.find(params[:id])
    if @movies.update(movie_params)
      flash[:notice] = "Movie successfully updated!"
      redirect_to @movies
    else
      render :edit
    end

  end

  
  #This is the destroy method of Movies
  def destroy
    @movies = Movie.find(params[:id])
    @movies.destroy 
    flash[:alert]= "Movie successfully deleted!"
    redirect_to movies_url
  end

  private 
  def movie_params
   params.require(:movie).
        permit(:title,:description,:rating,:total_gross,:released_on,:cast, :director, :duration, :image_file_name)
  end
end
