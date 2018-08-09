# README
A site where you can search movies according to a title. A list of 20 results maximum will be made.

## Admire the site
The link : ***https://movie-searcher-app.herokuapp.com/***

## Installation on computer

Version of ruby : **'2.5.1'**  
 
Write these lines to get the repository on your computer
```
$ git clone https://github.com/nanacy/movies-scraping-gem.git
$ cd movies-scraping-gem
```

Execute the following line to install the necessary gems and the correct version of Ruby: 
```
$ bundle install --without production
```
Execute this line to create the database:
```
$ rails db:migrate
```


To see the result on your local server
```
$ rails server
```
**Go on your website**
```
localhost:3000
```

## Display the database

* Open the file **development.sqlite3** (in the db file) with **DB Browser for SQLite**
* Do not forget to actualize and enjoy



## Make the application work on Heroku

Add your own api_key  
**Create your account to have some :**
https://www.themoviedb.org/account/signup

**To obtain the api_key :**  
SETTING  
API

Take the API Key  

**Add the key to the application**  
Clone the Heroku repository
```
$ heroku git:clone -a movie-searcher-app
$ cd movie-searcher-app
```
**Add your key in .env**
```
$ subl .env
```
**Write in the .env:**  
{
TMDB_KEY = "YOUR_OWN_API_KEY"
}  

**Add and save your changes**
```
$ git add .
$ git commit -am "make it better"
$ git push heroku master
```

--------------------------------------

