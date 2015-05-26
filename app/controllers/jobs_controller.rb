class JobsController < InheritedResources::Base

  private

    def job_params
      params.require(:job).permit(:position, :work_loc, :requirements, :description, :expired_date)
    end
end

