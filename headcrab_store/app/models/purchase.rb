class Purchase < ActiveRecord::Base
  belongs_to :headcrab
  belongs_to :buyer, class_name: 'User'
end
