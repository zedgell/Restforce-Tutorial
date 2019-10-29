class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  def search
    @lead = Lead.where("id = #{params[:id]}")
    respond_to do |format|
      if @lead.empty?
          format.html { redirect_to leads_url, notice: 'We could not find a lead with that id'}
      else
        format.html { redirect_to @lead[0] }
      end
    end    
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @salesforce = @lead.client.create('Lead', FirstName: @lead.firstname, LastName: @lead.lastname, Company: @lead.company, Email: @lead.email, Phone: @lead.phone)
    respond_to do |format|
      if @salesforce != false
        if @lead.save
          format.html { redirect_to @lead, notice: 'Lead was successfully created.' }
          format.json { render :show, status: :created, location: @lead }
        else
          format.html { render :new }
          format.json { render json: @lead.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to :new, notice: 'Lead was could not be created please try again.' }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    @leadupdate = Lead.new
    @leadFind = @leadupdate.client.query("select Id from Lead where FirstName = '#{@lead.firstname}' and LastName = '#{@lead.lastname}' and Company = '#{@lead.company}'")
    @leadid = @leadFind.first.Id
    respond_to do |format|
      if @lead.update(lead_params)
        @SFleadUpdate = @leadupdate.client.update('Lead', Id: @leadid, FirstName: @lead.firstname, LastName: @lead.lastname, Email: @lead.email, Company: @lead.company)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @leadupdate = Lead.new
    @leadFind = @leadupdate.client.query("select Id from Lead where FirstName = '#{@lead.firstname}' and LastName = '#{@lead.lastname}' and Company = '#{@lead.company}'")
    @leadid = @leadFind.first.Id
    @SFleadupdate = @leadupdate.client.destroy('Lead', Id: @leadid)
    if @SFleadupdate != false
      @lead.destroy
      respond_to do |format|
        format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @lead, notice: 'Lead could not be destroyed' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:firstname, :lastname, :company, :email, :phone)
    end
end
