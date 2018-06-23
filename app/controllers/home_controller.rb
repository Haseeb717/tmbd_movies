class HomeController < ApplicationController
  def index
  	page = params["next_page"] || 1
  	@next_index = params["next_page"].present? ? params["next_page"].to_i + 1 : 2

  	if params["sort"] == "title"
  		movies = Tmdb::Discover.movie(page: page,sort_by: 'original_title.asc')
	  	@movies = movies["results"] if movies.present?
  	elsif params["sort"] == "date"
  		movies = Tmdb::Discover.movie(page: page,sort_by: 'release_date.asc')
	  	@movies = movies["results"] if movies.present?

  	elsif params["sort"] == "genre"
  		movies = Tmdb::Discover.movie(page: page)
	  	@movies = movies["results"] if movies.present?
  	else
  		movies = Tmdb::Discover.movie(page: page,sort_by: 'original_title.asc')
	  	@movies = movies["results"] if movies.present?
  	end

  	@sort = params["sort"].present? ? params["sort"] : "title"
  		
  	respond_to do |format|
  		format.js { render 'append_movies' }
      format.html { render 'index' }
    end
  end

  def add_ratings
  	movie_id = params["movie_id"]
  	rate = params["rate"]
  	comment = params["comment"]
  	movie_name = params["name"]
 
  	Review.create(:movie_id=>movie_id,:rate=>rate,:comment=>comment,:movie_name=>movie_name)

  	respond_to do |format|
		  format.json { render json: {:success=>true }}
		end


  end
end
