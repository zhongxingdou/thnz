ActiveAdmin.register Job do
    permit_params :position, :work_loc, :requirements, :description, :expired_date
end