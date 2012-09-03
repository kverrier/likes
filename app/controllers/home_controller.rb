class HomeController < ApplicationController
  def index
    #require 'wikipedia'
    @users = User.all
    @likeables = Likeable.all
    @random_like = Likeable.all(:order => 'RANDOM()', :limit => 1).first
    @like_image = "image.jpg"
    #page = Wikipedia.find( 'Getting Things Done' )
    #@title = page.title
    #@content = page.content
  end
end
