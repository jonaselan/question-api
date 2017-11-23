class Question < ApplicationRecord
  belongs_to :user #asker
  has_many :answers

  scope :not_private, -> { where(private: false) }

  def self.search_by(terms)
    query = ''
    terms.split(',').each_with_index do |q, i|
      if i == 0
        query = "body LIKE '%#{q}%'"
      else
        query += " or body LIKE '%#{q}%'"
      end
    end
    Question.where(query)
  end
end
