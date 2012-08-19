class MoviesController < ApplicationController
 def index
   @movies = Movie.all
 end

 def show
    id = params[:id]
    @movie = Movie.find(id)
 end

 def new
 end

 def create
   Movie.create(params[:movie])
   redirect_to movies_path 
   flash[:notice] = "#{params[:movie][:title]} is updated in the db"
 end

 def edit
   id = params[:id]
   @movie = Movie.find(id)
 end

 def update
   @movie = Movie.find params[:id]
   @movie.update_attributes!(params[:movie])
   flash[:notice]= "#{params[:movie][:title]} was succesfully updated" 
   redirect_to movies_path
 end

 def destroy
   @movie = Movie.find params[:id]
   @movie.destroy
   flash[:notice] = "#{@movie[:title]} was succesfully deleted"
   redirect_to movies_path
 end
end

