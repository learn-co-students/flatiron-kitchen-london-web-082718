class RecipesController < ApplicationController
   before_action :set_recipe, only: [:update, :edit, :show, :delete]
  before_action :set_ingredients, only: [:new, :edit]

   def index
    @recipes = Recipe.all
  end

  def show
  end

   def new
    @recipe = Recipe.new
  end

   def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.valid?
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

   def edit
  end

   def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end


   def delete
    set_recipe.destroy
    redirect_to recipes_path
  end

   private

   def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
  
   def set_recipe
    @recipe = Recipe.find(params[:id])
  end
   def set_ingredients
    @ingredients = Ingredient.all.sort_by { |r| r.name }
  end
 end
