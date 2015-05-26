json.array!(@jobs) do |job|
  json.extract! job, :id, :position, :work_loc, :requirements, :description, :expired_date
  json.url job_url(job, format: :json)
end
