class Article  < ApplicationRecord
	validates :title, presence: true, length: {minimum:6, maximum: 100}
	validates :description, presence: true, length: {mimimum: 20, maximum: 200}
end
