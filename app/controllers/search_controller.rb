class SearchController < ApplicationController
  def results
    @query = params[:search]

    api_key = 'qse7essku53utvzgudug6u8y'
    bf = BadFruit.new(api_key)

    # Seach for film
    @movies = bf.movies.search_by_name(@query, 5, params[:page])
    @page = params[:page].to_i

  end
end
