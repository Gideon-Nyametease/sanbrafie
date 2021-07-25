class UserController < ApplicationController
    def create_user
      @user = User.new
    end
    
    def index
      @users = User.all.paginate(:page => params[:page], :per_page => 7).order(created_at: :desc)
    end
    
    def edit_user
       @user = User.find(params[:the_id])
    end
    
    def create_user_post
      @user = User.new(user_params)
      logger.info"User parameters: \n #{@user.inspect}"
      respond_to do |format|
          if @user.save
            format.html { redirect_to root_path, notice: 'You have successfully created an account, welcome!' }
            format.json { render :show, status: :ok, location: @service_code }
          else
            format.html { render :create_user }
            format.json { render json: @service_code.errors, status: :unprocessable_entity }
          end
        end  
      end
  
  
    def edit_user_post
      if current_user.super_admin? || current_user.role_id==5
        @user = User.find(params["user"]["id"])
  
        respond_to do |format|
          if @user.update!(user_params)
            format.html { redirect_to roles_path, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @city_town_master }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end
    end
    
      
      # def destroy    
      # if @user.active_status
        # @user.active_status = false
        # @user.save(validate: false)
        # respond_to do |format|
          # format.html { redirect_to @user, notice: 'City town master was successfully disabled.' }
          # format.json { head :no_content }
        # end
      # else
        # @user.active_status = true
        # @user.save(validate: false)
        # respond_to do |format|
          # format.html { redirect_to @user, notice: 'City town master was successfully enabled.' }
          # format.json { head :no_content }
        # end
      # end
  
      
      
      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:username, :surname, :othernames, :uid,:mobile_number,:password,:password_confirmation, :email, :role_code ) # {:division_id => []}
      end
  end
  