class BioCredentialsController < ApplicationController
  before_action :set_bio_credential, only: %i[ show edit update destroy ]

  # GET /bio_credentials or /bio_credentials.json
  #def index
  #  @bio_credentials = BioCredential.all
  # end

  def index
    @bio_credentials = BioCredential.includes(:user).all
    if params[:role].present?
      role = params[:role]
      @bio_credentials = @bio_credentials.select { |credential| credential.user.public_send("is_#{role}") }
    end
  end

  # GET /bio_credentials/1 or /bio_credentials/1.json
  def show
  end

  # GET /bio_credentials/new
  def new
    @bio_credential = BioCredential.new
  end

  # GET /bio_credentials/1/edit
  def edit
  end

  # POST /bio_credentials or /bio_credentials.json
  def create
    @bio_credential = BioCredential.new(bio_credential_params)

    respond_to do |format|
      if @bio_credential.save
        format.html { redirect_to bio_credential_url(@bio_credential), notice: "Bio credential was successfully created." }
        format.json { render :show, status: :created, location: @bio_credential }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bio_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bio_credentials/1 or /bio_credentials/1.json
  def update
    respond_to do |format|
      if @bio_credential.update(bio_credential_params)
        format.html { redirect_to bio_credential_url(@bio_credential), notice: "Bio credential was successfully updated." }
        format.json { render :show, status: :ok, location: @bio_credential }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bio_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bio_credentials/1 or /bio_credentials/1.json
  def destroy
    @bio_credential.destroy!

    respond_to do |format|
      format.html { redirect_to bio_credentials_url, notice: "Bio credential was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bio_credential
      @bio_credential = BioCredential.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bio_credential_params
      params.require(:bio_credential).permit(:bio, :license_number, :license_description, :license_effective_date, :license_expire_date, :user_id)
    end
end
