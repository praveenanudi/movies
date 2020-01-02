	 require 'httparty'
     require 'json'
class MoviesController < ApplicationController
  def index
  	if params["commit"] == "Search" && params["search"]!=""
  		tit= params["search"]
  	    res = HTTParty.get("http://www.omdbapi.com/?y=2019&s=#{tit}&type=movie&apikey=ce0cdc5b")
	  	 if  res["Response"] == "False"
	       flash[:alert] = "Movie not found"
	  	 else
	  	 	@response = res
	  	 end
    else
    	@response = HTTParty.get('http://www.omdbapi.com/?s=%27true%27&y=2019&type=movie&apikey=ce0cdc5b')
    end
  
  end

  def show
    imd = params["id"]
  	@response = HTTParty.get("http://www.omdbapi.com/?y=2019&i=#{imd}&type=movie&apikey=ce0cdc5b")
  end

  def fav 
  end

end
