json.questions @questions do |question|
  json.id   question.id
  json.body question.body

  json.asker do
    json.id   question.user.id
    json.name question.user.name
  end

  json.answers question.answers do |answer|
    json.body answer.body

    json.provider do
      json.id   answer.user.id
      json.name answer.user.name
    end
  end
end
