class ProdCategoriesController < InheritedResources::Base

  private

    def prod_category_params
      params.require(:prod_category).permit(:name, :order_no)
    end
end

