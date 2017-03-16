class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @product_aggregator = ProductAggregator.new(SearchTerm.new(params[:name]))
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
      params.require(:search_term).permit(:search_term)
    end
end
