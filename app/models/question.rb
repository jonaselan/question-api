class Question < ApplicationRecord
  belongs_to :user #asker
  has_many :answers
end
