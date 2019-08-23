class Gallery < ApplicationRecord
  has_many :gallery_attachments
  accepts_nested_attributes_for :gallery_attachments

  validates :title, presence: true
end
