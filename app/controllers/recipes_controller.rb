class RecipesController < ApplicationController
  before_filter :require_user
  before_filter :get_recipe_from_param, :only => [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.order("created_at DESC")
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
      flash[:error] = "Rezept konnte nicht gespeichert werden!"
      render :action => :new
    end
  end

  def show
  end

  def edit
    unless is_current_user_allowed?
      flash[:error] = "Nur der Ersteller des Rezepts kann es bearbeiten!"
    end
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

  def destroy
    if is_current_user_allowed?
      if @recipe.destroy
        flash[:notice] = "Rezept wurde gelöscht"
        redirect_to :action => :index
      else
        flash[:error] = "Rezept konnte nicht gelöscht werden"
      end
    else
      flash[:error] = "Nur der Ersteller des Rezepts kann es löschen!"
    end
  end

  private
    def get_recipe_from_param
      @recipe = Recipe.find(params[:id])
    end

    def is_current_user_allowed?
      @recipe.user == current_user
    end
end
