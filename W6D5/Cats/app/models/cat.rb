require 'action_view' 
require 'date'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w(White Black Brown Gray Orange)

  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: { in: COLORS, message: 'Not a valid cat color' }
  validates :name, presence: true
  validates :sex, presence: true, inclusion: { in: %w(M F), message: 'Not a valid sex' }
  validates :description, presence: true

  def age
    time_ago_in_words(self.birth_date) + ' old'
  end
end

#validates :size, inclusion: { in: %w(small medium large),
#kitty.birth_date #=> #<Date: 2015-01-20>