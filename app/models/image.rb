class Image < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image, styles: {large: '600x600>', thumb: ['100x100>', :png]}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
                                    #:content_type => %w(image/jpeg image/jpg image/png)
  validates :album_id, presence: true
end
