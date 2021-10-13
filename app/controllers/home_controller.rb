class HomeController < ApplicationController
  def top
    @cookings = Cooking.where.not(image_1: nil).order(id: "DESC")
  end
  
end
