module Doorkeeper
  class ApplicationsController < ApplicationController
    respond_to :html

    before_filter :authenticate_admin!

    def index
      @applications = Application.all
    end

    def new
      @application = Application.new
    end

    def create
      pars = params[:application] || {}
      pars[:resource_owner_id] ||= current_user.id_user
      @application = Application.new(pars)
      flash[:notice] = "Application created" if @application.save
      respond_with @application
    end

    def show
      @application = Application.find(params[:id])
    end

    def edit
      @application = Application.find(params[:id])
    end

    def update
      pars = params[:application] || {}
      pars[:resource_owner_id] ||= current_user.id_user
      @application = Application.find(params[:id])
      flash[:notice] = "Application updated" if @application.update_attributes(pars)
      respond_with @application
    end

    def destroy
      @application = Application.find(params[:id])
      flash[:notice] = "Application deleted" if @application.destroy
      redirect_to applications_url
    end
  end
end
