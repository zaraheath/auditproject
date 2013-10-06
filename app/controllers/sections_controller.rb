class SectionsController < ApplicationController

  def edit
    @section = Section.find params[:id]
  end

  def update
    @section = Section.find params[:id]
    if @section.update_attributes(section_params)
      redirect_to section_path(id: @section.id)
    else
      respond_with @section
    end
  end

  def destroy

  end

  private

  def section_params
    params.require(:section).permit(:name, :description, :controls_count)
  end

end
