class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def import
    Customer.import(params[:file])
    redirect_to customers_path, notice: "Datos importados!"
  end

  # GET /customers
  # GET /customers.json
  def index
    if params.has_key?(:fullname) || params.has_key?(:prof_title) || params.has_key?(:specialty) 
      @customers = Customer.where('fullname like ? AND prof_title like ? AND specialty like ?', '%' + params[:fullname].upcase + '%', '%' + params[:prof_title].to_s + '%', '%' + params[:specialty].upcase + '%').paginate(page:params[:page], per_page: 10)
    else
        @customers = Customer.all.paginate(page:params[:page], per_page: 10)
    end
    
    
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customer.user_id = current_user.id

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:user_id, :fullname, :cel, :tel, :address, :city, :email, :prof_title, :specialty, :specialty2)
    end
end
