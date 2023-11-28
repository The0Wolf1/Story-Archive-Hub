class Story < ApplicationRecord
    attr_accessor :step
    
    validates :title, presence: true
    validates :content, presence: true
    validates :description, presence: true
end
