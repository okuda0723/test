class Cooking < ApplicationRecord
    has_many :directions, dependent: :destroy
    has_many :ingredients, dependent: :destroy
    accepts_nested_attributes_for :ingredients, :directions, allow_destroy: true
    
    mount_uploader :image_1, ImgUploader

    validates_associated :ingredients
    validates_associated :directions
    
    validates :image_1, presence: true
    validates :title, presence: true
    validates :created_date, presence: true
    validates :rating, presence: true
    validates :comment, presence: true
 

    def self.search(search)
        if search
          Cooking.where(['title LIKE ?', "%#{search}%"])
        else
          Cooking.all
        end
      end
        


end
