class CustomerMsgsController < ApplicationController
  before_action :set_customer_msg, only: %i[ show edit update destroy ]

  # GET /customer_msgs or /customer_msgs.json
  def index
    @customer_msgs = CustomerMsg.all
  end

  # GET /customer_msgs/1 or /customer_msgs/1.json
  def show
  end

  # GET /customer_msgs/new
  def new
    @customer_msg = CustomerMsg.new
  end

  # GET /customer_msgs/1/edit
  def edit
  end

  # POST /customer_msgs or /customer_msgs.json
  def create
    @customer_msg = CustomerMsg.new(customer_msg_params)

    respond_to do |format|
      if @customer_msg.save
        format.html { redirect_to @customer_msg, notice: "Customer msg was successfully created." }
        format.json { render :show, status: :created, location: @customer_msg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_msgs/1 or /customer_msgs/1.json
  def update
    respond_to do |format|
      if @customer_msg.update(customer_msg_params)
        format.html { redirect_to @customer_msg, notice: "Customer msg was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_msg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_msgs/1 or /customer_msgs/1.json
  def destroy
    @customer_msg.destroy
    respond_to do |format|
      format.html { redirect_to customer_msgs_url, notice: "Customer msg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_msg
      @customer_msg = CustomerMsg.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_msg_params
      params.require(:customer_msg).permit(:email, :surname, :othernames, :full_name, :message, :user_id, :status)
    end
end
