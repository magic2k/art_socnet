class Image < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, styles: {large: '600x600>', thumb: ['100x100>' : png]}

  validates :album_id, presence: true
end
