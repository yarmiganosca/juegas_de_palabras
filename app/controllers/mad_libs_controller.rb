class MadLibsController < ApplicationController
  # GET /mad_libs/new
  def new
    @page_name = "Create a Mad Lib"
    render action: 'new'
  end

  # POST /mad_libs
  # POST /mad_libs.json
  def create
    @mad_lib = MadLib.new(:text => params[:mad_lib_text])

    respond_to do |format|
      if @mad_lib.save
        format.html do
          new_solution_path = new_mad_lib_solution_path :mad_lib_id => @mad_lib.id
          redirect_to new_solution_path, notice: 'New Mad Lib created'
        end
        format.json { render json: @mad_lib, status: created, location: @mad_lib }
      else
        format.html { render action: 'new' }
        format.json { render json: @mad_lib.errors, status: unprocessable_entity }
      end
    end
  end
end
