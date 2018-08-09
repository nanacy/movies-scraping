require 'dotenv'
Dotenv.load
# "#{baseURL}550#{finURL}"

class ScraperFilm
	attr_accessor :api, :baseURL, :finURL

	def initialize
		@api = ENV["TMDB_KEY"]
		@baseURL = "https://api.themoviedb.org/3/movie/"
		#inserer id
		@finURL = "?api_key=".concat(@api)
		# https://api.themoviedb.org/3/movie/550?api_key=c4dfdf80f2721ec0a4dc18b3d8fa9b00
		
		#CONNEXION
		Tmdb::Api.key(@api)
	end

	#fonction qui recoit en paramètre : nom du film
	#et qui renvoit la : liste des id des films
	def search_id(nom_film)
		batman = Tmdb::Movie.find(nom_film)
		liste_id = []
		print "Nombre de film : #{batman.length} \n\n"
		batman.each_with_index do |film, i|
			liste_id << film.id
			if i>=20
				return liste_id
			end
		end
		# puts liste_id
		return liste_id
	end

	#fonction qui recoit en paramètre : liste d'id de film
	#et qui renvoit un array de hash 
	#(contenant les infos pour chaque films)
	def search_info(liste_id)
		liste_info = []

		liste_id.each do |id|
			movie = Tmdb::Movie.detail(id)
			title = movie["original_title"]
			release = movie["release_date"]
			image = movie["poster_path"]
			
			# puts movie_cast = Tmdb::Movie.casts(id)
			# director = movie_cast[]
			
			film = {"title"=>title, "release"=>release, "image"=>image}
			liste_info << film
		end
		return liste_info
	end

	#fonction qui lance la recherche des infos
	#et met dans un array : title/release_date/image/director
	def perform
		liste_id = search_id("batman")
		liste_info = search_info(liste_id)
	end
end



