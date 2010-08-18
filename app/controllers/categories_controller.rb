class CategoriesController < ApplicationController
  before_filter :require_user, :only_admin
  before_filter :get_category_from_param, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.find(:all, :order => "display_order ASC")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Kategorie wurde hinzugefügt"
      redirect_back_or_default categories_url
    else
      flash[:error] = "Kategorie konnte nicht hinzugefügt werden!"
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(params[:category])
      flash[:notice] = "Kategorie erfolgreich geändert"
      redirect_to :action => :index
    else
      flash[:error] = "Kategorie konnte nicht geändert werden!"
      render :action => :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Kategorie wurde gelöscht"
      redirect_to :action => :index
    else
      flash[:error] = "Kategorie konnte nicht gelöscht werden"
    end
  end

  private
    def get_category_from_param
      @category = Category.find(params[:id])
    end
end
