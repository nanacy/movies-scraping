require 'dotenv'
Dotenv.load

class ScraperFilm
	attr_accessor :api

	def initialize
		@api = ENV["TMDB_KEY"]
		#CONNEXION
		Tmdb::Api.key(@api)
	end

	def test
		spiderman = Tmdb::Job.list
	end

	#fonction qui recoit en paramètre : nom du film
	#et qui renvoit la : liste des id des films
	def search_id(nom_film)
		batman = Tmdb::Movie.find(nom_film)
		liste_id = []
		puts "Nombre de film : #{batman.length}"
		puts "-"*20
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

	#fonction qui prend en paramètre : un titre de film
	#qui lance les fonctions de recherche
	#et met dans un array : title/release_date/image/director
	def perform(titre)
		liste_id = search_id(titre)
		liste_info = search_info(liste_id)
		return liste_info
	end
end



