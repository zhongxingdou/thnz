class LabelsController < InheritedResources::Base

  private

    def label_params
      params.require(:label).permit(:name, :content)
    end
end

