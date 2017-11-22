class Answer < ApplicationRecord
  belongs_to :user # provider
  belongs_to :question
end
