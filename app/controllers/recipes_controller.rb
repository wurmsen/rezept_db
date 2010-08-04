class RecipesController < ApplicationController
  before_filter :require_user
  before_filter :get_recipe_from_param, :only => [:show, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredients.build }
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
  end

  def edit
  end

  def update
    if @recipe.update_attributes(params[:recipe])
      flash[:notice] = "Rezept erfolgreich geändert"
      redirect_to @recipe
    else
      flash[:error] = "Rezept konnte nicht geändert werden!"
      render :action => :edit
    end
  end

  private
    def get_recipe_from_param
      @recipe = Recipe.find(params[:id])
    end
end
