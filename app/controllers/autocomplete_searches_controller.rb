class AutocompleteSearchesController < ApplicationController
  respond_to :js

  def Index
    @products = Product.discontinued.limit(12).search_for_name(params[:term])
    respond_with(@products)
  end

end
