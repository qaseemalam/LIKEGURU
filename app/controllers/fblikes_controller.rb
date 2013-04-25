class FblikesController < ApplicationController
  # GET /fblikes
  # GET /fblikes.json
  def index
    @fblikes = Fblike.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fblikes }
    end
  end

  # GET /fblikes/1
  # GET /fblikes/1.json
  def show
    @fblike = Fblike.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fblike }
    end
  end

  # GET /fblikes/new
  # GET /fblikes/new.json
  def new
    @fblike = Fblike.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fblike }
    end
  end

  # GET /fblikes/1/edit
  def edit
    @fblike = Fblike.find(params[:id])
  end

  # POST /fblikes
  # POST /fblikes.json
  def create
    @fblike = Fblike.new(params[:fblike])

    respond_to do |format|
      if @fblike.save
        format.html { redirect_to @fblike, notice: 'Fblike was successfully created.' }
        format.json { render json: @fblike, status: :created, location: @fblike }
      else
        format.html { render action: "new" }
        format.json { render json: @fblike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fblikes/1
  # PUT /fblikes/1.json
  def update
    @fblike = Fblike.find(params[:id])

    respond_to do |format|
      if @fblike.update_attributes(params[:fblike])
        format.html { redirect_to @fblike, notice: 'Fblike was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fblike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fblikes/1
  # DELETE /fblikes/1.json
  def destroy
    @fblike = Fblike.find(params[:id])
    @fblike.destroy

    respond_to do |format|
      format.html { redirect_to fblikes_url }
      format.json { head :ok }
    end
  end
end
