class HomeController < ApplicationController
  def index
    # local variables
    @users = User.all
    @likeables = Likeable.all
    @random_like = Likeable.all(:order => 'RANDOM()', :limit => 1).first

    #mediawiki requests
    require 'net/http'
    key = "The League"
    uri_key = URI.escape(key, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"));
    host = 'en.wikipedia.org'
    #query = "/w/api.php?action=query&prop=extracts&titles=#{uri_key}&format=json&exintro=1&redirects"

    #resp = Net::HTTP.get(host, query)
    #parsed_json = ActiveSupport::JSON.decode(resp)
    #@content = parsed_json["query"]["pages"].first[1]["extract"].html_safe

    #query = "/w/api.php?action=query&list=random&rnlimit=5"

    #page = Wikipedia.find( 'Getting Things Done' )
    #@title = page.title
    #@content = page.content


    # Set up rotten tomatoes
    api_key = 'qse7essku53utvzgudug6u8y'
    bf = BadFruit.new(api_key)

    # Seach for film
    movie = bf.movies.search_by_id(@random_like.rt_id)

    @movie_title = movie.name
    @movie_image = movie.posters.profile
  end
end
