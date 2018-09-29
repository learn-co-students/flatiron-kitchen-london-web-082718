class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:update, :edit, :show]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.valid?
      redirect_to ingredient_path(@ingredient)
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end
  end


  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      flash[:errors] = @ingredient.errors.full_messages
      redirect_to new_ingredient_path
    end
  end

  def delete
    set_ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

end
