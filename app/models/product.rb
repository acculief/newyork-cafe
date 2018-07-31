class Product < ApplicationRecord
  acts_as_taggable_on :labels
  acts_as_taggable 
end
