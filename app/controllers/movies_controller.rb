class MoviesController < ApplicationController
	attr_accessor :liste, :title

  def home
  end

  #recupère le titre (entrée par l'utilisateur du site)
  #rempli la base de donnée avec les films trouvés
  #si la personne ne rentre rien, on reste sur home
  def create
  	if params["title"]!=""
  		title = params["title"]

      liste = ScraperFilm.new.perform(title)
      liste.each do |movie|
        new_movie = Movie.create(title: movie["title"], release: movie["release"], image: movie["image"])
        new_movie.save
      end
	  	redirect_to "/search"
  	else
  		puts "--Le champ titre est vide--"
  		redirect_to '/'
  	end
  end

  def search
    @movie = Movie.all
  end

end
