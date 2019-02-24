class SearchesController < ApplicationController
  def index
    query = params[:query]
    if query
      render :json => Search.create!(query: query).result
    else
      @users = User.all
    end
  end

  def show
    @search = Search.find_by_id(params[:id])
    respond_to do |format|
      format.html { 
        @users = User.find( @search.get_ids )
        render :template => "searches/index"
      }
      format.json { render json: @search.result }
    end
  end
end
