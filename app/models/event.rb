class Event < ApplicationRecord
  belongs_to :calendar

  validates :calendar, presence: true
  validates :name, presence: true
  validates :dstart, presence: true
  validates :dend, presence: true
end
