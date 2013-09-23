class AuditsController < ApplicationController

  before_filter :authenticate_user!
  respond_to :html

  def index
    @audits = current_user.audits
  end

  def new
    @audit = current_user.audits.build
  end

  def create
    @audit = current_user.audits.new(audit_params)
    if @audit.save
      redirect_to audit_path(id: @audit.id)
    else
      respond_with @audit
    end
  end

  def edit
    @audit = current_user.audits.find params[:id]
  end

  def update
    @audit = current_user.audits.find params[:id]
    if @audit.update_attributes(audit_params)
      redirect_to audit_path(id: @audit.id)
    else
      respond_with @audit
    end
  end

  def show
    @audit = Audit.find params[:id]
  end

  private

  def audit_params
    params.require(:audit).permit(:name, :description, :client, :auditor_name, :start_date, :end_date, :delivery_date, :objective, :global_opinion, :global_recommendation)
  end

end
