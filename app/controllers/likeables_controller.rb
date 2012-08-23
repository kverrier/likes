class LikeablesController < ApplicationController
  def index
    @likeables = Likeable.all
  end

  def new
    @likeable = Likeable.new
  end

  def create
    @likeable = Likeable.new(params[:likeable])
    @likeable.save
    flash[:notice] = "Like created"
    redirect_to @likeable
  end

  def show
    @like = Likeable.find(params[:id])
  end

   def edit
    @likeable = Likeable.find(params[:id])
  end
  
  def update
    @likeable = Likeable.find(params[:id])
    if @likeable.update_attributes(params[:likeable])
      flash[:notice] = "Successfully updated likeable."
      redirect_to @likeable
    else
      render :action => 'edit'
    end
  end

  def rate
    @likeable = Likeable.find(params[:id])
    @likeable.rate(params[:stars], current_user, params[:dimension])

    respond_to do |format|
      format.html {render :action => "rate"}
      format.js
    end

    #render :update do |page|
      #page.replace_html @like.wrapper_dom_id(params), ratings_for(@like, params.merge(:wrap => false))
      #page.visual_effect :highlight, @like.wrapper_dom_id(params)
    #end
  end
end
