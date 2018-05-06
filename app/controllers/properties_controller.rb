class PropertiesController < ApplicationController

  def new
    @property = Property.new()
  end

  def show
    @property = Property.find(params[:id])
  end

  def index
    @properties = Property.all
  end

  def edit
    @property = Property.find(params[:id])
  end

  def create
    @property = Property.create(property_params)
    if @property.valid?
      redirect_to @property
    else
      flash[:errors] = @property.errors.full_messages
      redirect_to new_property_path
    end
  end

  def update
    @property = Property.update(property_params)
    if @property.valid?
      redirect_to @property
    else
      flash[:errors] = @property.errors.full_messages
      redirect_to edit_property_path(@property)
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :address_id, :sector_id, :unit_id)
  end
end
