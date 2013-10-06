class ControlsController < ApplicationController

  def new
    @control = Control.new(section_id: params[:section])
  end

  def create
    @control = Control.new(control_params)
    if @control.save
      redirect_to edit_control_path(id: @control.id)
    else
      respond_with @control
    end
  end

  def edit
    @control = Control.find params[:id]
  end

  def update
    @control = Control.find params[:id]
    if @control.update_attributes(control_params)
      redirect_to edit_control_path(id: @control.id)
    else
      respond_with @control
    end
  end

  def destroy

  end

  private

  def control_params
    params.require(:control).permit(:name, :description, :grade_id, :result, :recommendation, :code, :section_id)
  end
end
