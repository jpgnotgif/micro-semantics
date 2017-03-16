class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :validate_search_term

  def index
    @product_aggregator = ProductAggregator.new(SearchTerm.new(product_params[:name]))
    @product_aggregator.aggregate
    @products = @product_aggregator.products
  end

  def show
    @offers = SellerOffer.where(seller_id: @product.seller_ids)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.permit(:name)
    end

    def validate_search_term
      name = product_params[:name]
      redirect_to '/' unless name.present?
    end
end
