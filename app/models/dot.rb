class Dot < ApplicationRecord
  belongs_to :student

  with_options presence: true do
    validates :title
    validates :category
    validates :introduction
    validates :effort
    validates :study
    validates :acted_at
  end
end
