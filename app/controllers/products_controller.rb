class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :show_in_home, :pic, :prod_categories_id, :description)
    end
end

