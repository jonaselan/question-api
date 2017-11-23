json.dashboard do
  json.users_count       User.count
  json.questions_count   Question.count
  json.answers_count     Answer.count
  json.tenants Tenant.select(:name, :request_counts) do |ten|
    json.name ten.name
    json.request_counts ten.request_counts
  end
end
