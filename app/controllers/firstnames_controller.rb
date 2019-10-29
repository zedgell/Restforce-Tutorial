class FirstnamesController < ApplicationController
  before_action :set_firstname, only: [:show, :edit, :update, :destroy]

  # GET /firstnames
  # GET /firstnames.json
  def index
    @firstnames = Firstname.all
  end

  # GET /firstnames/1
  # GET /firstnames/1.json
  def show
  end

  # GET /firstnames/new
  def new
    @firstname = Firstname.new
  end

  # GET /firstnames/1/edit
  def edit
  end

  # POST /firstnames
  # POST /firstnames.json
  def create
    @firstname = Firstname.new(firstname_params)

    respond_to do |format|
      if @firstname.save
        format.html { redirect_to @firstname, notice: 'Firstname was successfully created.' }
        format.json { render :show, status: :created, location: @firstname }
      else
        format.html { render :new }
        format.json { render json: @firstname.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firstnames/1
  # PATCH/PUT /firstnames/1.json
  def update
    respond_to do |format|
      if @firstname.update(firstname_params)
        format.html { redirect_to @firstname, notice: 'Firstname was successfully updated.' }
        format.json { render :show, status: :ok, location: @firstname }
      else
        format.html { render :edit }
        format.json { render json: @firstname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firstnames/1
  # DELETE /firstnames/1.json
  def destroy
    @firstname.destroy
    respond_to do |format|
      format.html { redirect_to firstnames_url, notice: 'Firstname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_firstname
      @firstname = Firstname.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def firstname_params
      params.require(:firstname).permit(:lastname, :company, :email, :phone)
    end
end
