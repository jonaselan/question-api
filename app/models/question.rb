class Question < ApplicationRecord
  belongs_to :user #asker
  has_many :answers

  scope :not_private, -> { where(private: false) }
end
