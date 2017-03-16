class ProductAggregator
  attr_reader :search_term, :products

  def initialize(search_term)
    @search_term = search_term
    @client = Semantics3::Products.new(ENV['API_KEY'], ENV['API_SECRET'])
    @products = []
  end

  def aggregate
    begin
      @products = Product.where(term: @search_term.value)

      if @products.empty?
        @client.products_field('search', @search_term.value)
        data = OpenStruct.new(@client.get_products)

        raise "[Semantics3 API] Received code #{data.code.inspect}" if data.code != 'OK'

        api_products = data.results.map { |result| OpenStruct.new(result) }

        Product.transaction do
          @products = api_products.map do |api_product|
            product_attrs = {
              name: api_product.name,
              image_url: api_product.images.first,
              manufacturer: api_product.manufacturer,
              model: api_product.model,
              term: @search_term.value
            }
            product = Product.create!(product_attrs)
            raise 'Failed to create product' unless product.persisted?
            product
          end
        end
      end
    rescue SocketError => socket_exception
      Rails.logger.error('[Semantics3 API] Unable to connect')
      Rails.logger.error(socket_exception.message)
      Rails.logger.error(socket_exception.backtrace.join("\n"))
    rescue Exception => exception
      Rails.logger.error(exception.message)
      Rails.logger.error(exception.backtrace.join("\n"))
    else
      #
    ensure
      @products
    end
  end
end
