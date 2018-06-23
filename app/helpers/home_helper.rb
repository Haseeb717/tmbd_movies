module HomeHelper
	def genre(movie)
		genre_id = movie.genre_ids.first if movie.genre_ids.present? 
	  Genre.find_by_db_genre_id(genre_id).title if genre_id.present?
	end

	def average_rating(movie_id)
		reviews = Review.where(:movie_id=>movie_id).pluck(:rate)
		avg = (reviews.sum / reviews.length) if reviews.present?
		avg.present? ? avg.round : 0 
	end

end
