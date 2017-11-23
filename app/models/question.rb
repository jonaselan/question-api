class Question < ApplicationRecord
  belongs_to :user #asker
  has_many :answers

  scope :not_private, -> { where(private: false) }

  def self.search_by(terms)
    query = ''
    terms.split(',').each_with_index do |q, i|
      query += i.zero? ? "body LIKE '%#{q}%'" : " or body LIKE '%#{q}%'"
    end
    Question.where(query)
  end
end
