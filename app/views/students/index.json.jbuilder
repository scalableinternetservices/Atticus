json.array!(@students) do |student|
  json.extract! student, :id, :email, :school, :description
  json.url student_url(student, format: :json)
end
