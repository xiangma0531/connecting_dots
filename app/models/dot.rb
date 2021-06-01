class Dot < ApplicationRecord
  belongs_to :student
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :category_id
    validates :introduction
    validates :effort
    validates :study
    validates :acted_at
  end
end
