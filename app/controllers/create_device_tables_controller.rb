class CreateDeviceTablesController < ApplicationController
  before_action :set_create_device_table, only: [:show, :edit, :update, :destroy]

  # GET /create_device_tables
  # GET /create_device_tables.json
  def index
    @create_device_tables = CreateDeviceTable.all
  end

  # GET /create_device_tables/1
  # GET /create_device_tables/1.json
  def show
  end

  # GET /create_device_tables/new
  def new
    @create_device_table = CreateDeviceTable.new
  end

  # GET /create_device_tables/1/edit
  def edit
  end

  # POST /create_device_tables
  # POST /create_device_tables.json
  def create
    @create_device_table = CreateDeviceTable.new(create_device_table_params)

    respond_to do |format|
      if @create_device_table.save
        format.html { redirect_to @create_device_table, notice: 'Create device table was successfully created.' }
        format.json { render :show, status: :created, location: @create_device_table }
      else
        format.html { render :new }
        format.json { render json: @create_device_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /create_device_tables/1
  # PATCH/PUT /create_device_tables/1.json
  def update
    respond_to do |format|
      if @create_device_table.update(create_device_table_params)
        format.html { redirect_to @create_device_table, notice: 'Create device table was successfully updated.' }
        format.json { render :show, status: :ok, location: @create_device_table }
      else
        format.html { render :edit }
        format.json { render json: @create_device_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /create_device_tables/1
  # DELETE /create_device_tables/1.json
  def destroy
    @create_device_table.destroy
    respond_to do |format|
      format.html { redirect_to create_device_tables_url, notice: 'Create device table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_create_device_table
      @create_device_table = CreateDeviceTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_device_table_params
      params.require(:create_device_table).permit(:nickname, :street_address, :city, :state, :postal_code, :longitude, :latitude, :api_key)
    end
end
