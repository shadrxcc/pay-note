# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  has_many :items
end
