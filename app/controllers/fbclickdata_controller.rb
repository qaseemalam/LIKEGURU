class FbclickdataController < ApplicationController
  # GET /fbclickdata
  # GET /fbclickdata.json
  def index
    @fbclickdata = Fbclickdatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fbclickdata }
    end
  end

  # GET /fbclickdata/1
  # GET /fbclickdata/1.json
  def show
    @fbclickdatum = Fbclickdatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fbclickdatum }
    end
  end

  # GET /fbclickdata/new
  # GET /fbclickdata/new.json
  def new
    @fbclickdatum = Fbclickdatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fbclickdatum }
    end
  end

  # GET /fbclickdata/1/edit
  def edit
    @fbclickdatum = Fbclickdatum.find(params[:id])
  end

  # POST /fbclickdata
  # POST /fbclickdata.json
  def create
    @fbclickdatum = Fbclickdatum.new(params[:fbclickdatum])

    respond_to do |format|
      if @fbclickdatum.save
        format.html { redirect_to @fbclickdatum, notice: 'Fbclickdatum was successfully created.' }
        format.json { render json: @fbclickdatum, status: :created, location: @fbclickdatum }
      else
        format.html { render action: "new" }
        format.json { render json: @fbclickdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  def catreport
    @dat1 = Fbclickdatum.count(:group => :Like_category)            
  end


  # PUT /fbclickdata/1
  # PUT /fbclickdata/1.json
  def update
    @fbclickdatum = Fbclickdatum.find(params[:id])

    respond_to do |format|
      if @fbclickdatum.update_attributes(params[:fbclickdatum])
        format.html { redirect_to @fbclickdatum, notice: 'Fbclickdatum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fbclickdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fbclickdata/1
  # DELETE /fbclickdata/1.json
  def destroy
    @fbclickdatum = Fbclickdatum.find(params[:id])
    @fbclickdatum.destroy

    respond_to do |format|
      format.html { redirect_to fbclickdata_url }
      format.json { head :ok }
    end
  end
end
