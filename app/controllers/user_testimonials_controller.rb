class UserTestimonialsController < ApplicationController
  before_action :set_user_testimonial, only: %i[ show edit update destroy ]

  # GET /user_testimonials or /user_testimonials.json
  def index
    @user_testimonials = UserTestimonial.all
  end

  # GET /user_testimonials/1 or /user_testimonials/1.json
  def show
  end

  # GET /user_testimonials/new
  def new
    @user_testimonial = UserTestimonial.new
  end

  # GET /user_testimonials/1/edit
  def edit
  end

  # POST /user_testimonials or /user_testimonials.json
  def create
    @user_testimonial = UserTestimonial.new(user_testimonial_params)

    respond_to do |format|
      if @user_testimonial.save
        format.html { redirect_to @user_testimonial, notice: "User testimonial was successfully created." }
        format.json { render :show, status: :created, location: @user_testimonial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_testimonials/1 or /user_testimonials/1.json
  def update
    respond_to do |format|
      if @user_testimonial.update(user_testimonial_params)
        format.html { redirect_to @user_testimonial, notice: "User testimonial was successfully updated." }
        format.json { render :show, status: :ok, location: @user_testimonial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_testimonials/1 or /user_testimonials/1.json
  def destroy
    @user_testimonial.destroy
    respond_to do |format|
      format.html { redirect_to user_testimonials_url, notice: "User testimonial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_testimonial
      @user_testimonial = UserTestimonial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_testimonial_params
      params.require(:user_testimonial).permit(:fullname, :trip, :testimonial)
    end
end
