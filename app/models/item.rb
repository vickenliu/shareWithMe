class Item < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :genres, dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :genres, reject_if: :all_blank, allow_destroy: true
end
