class SearchTermsController < ApplicationController
  def new
    @search_term = SearchTerm.new
  end

  def create
    @search_term = SearchTerm.new(search_term_params[:value])
    if @search_term.valid?
      redirect_to products_path(name: @search_term.value)
    else
      render :new
    end
  end

  private
  def search_term_params
    params.require(:search_term).permit(:value)
  end
end
