class RecipesController < ApplicationController
  before_filter :require_user

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = "Rezept gespeichert"
      redirect_back_or_default recipes_url
    else
      render :action => :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Rezept erfolgreich geändert"
      redirect_to recipe_url(@recipe.id)
    else
      flash[:error] = "Rezept konnte nicht geändert werden!"
      render :action => :edit
    end
  end
end
