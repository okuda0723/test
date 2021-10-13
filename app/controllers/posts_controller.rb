class PostsController < ApplicationController

  def post
    @cooking=Cooking.find_by(id:params[:id])
  end

  def list
      @cookings = Cooking.where.not(image_1: nil).order(id: "DESC")
  end

  def new
    @cooking=Cooking.new
    5.times{@cooking.ingredients.build}
    5.times{@cooking.directions.build}
  end

  def create
    logger.debug(cooking_params)
    @cooking=Cooking.new(cooking_params)
    if @cooking.save
      redirect_to("/posts/#{@cooking.id}", notice: '投稿が完了しました')
    else
      render :new
    end
  end

  def edit
    @cooking=Cooking.find(params[:id])
  end

  def update
    @cooking=Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      redirect_to("/posts/#{@cooking.id}", notice: '編集が完了しました')
    else
      render :edit
    end
  end

  def destroy
    @cooking=Cooking.find(params[:id])
    if @cooking.destroy
    redirect_to("/posts/list")
    else
    render "posts/#{@cooking.id}"
    end
  end

  def search
    @cookings=Cooking.search(params[:search]).order(id: "DESC")
  end


  private

  def cooking_params
    params.require(:cooking).permit(:title, :created_date, :image_1, :image_2, :image_3, :comment, :rating,
                                   ingredients_attributes:[:ingredient_name, :quantity, :_destroy, :id], 
                                   directions_attributes:[:step_number, :text, :_destroy, :id])
   end

end
