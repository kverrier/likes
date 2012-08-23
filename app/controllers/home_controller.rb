class HomeController < ApplicationController
  def index
    @users = User.all
    @likeables = Likeable.all
  end
end
