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
  
      division_ids = params[:division_ids]
      main = params[:main]
      logger.info "#################################################"
      logger.info "THESE ARE THE SELECTED IDS #{division_ids.inspect}"
      logger.info "#################################################"
  
      respond_to do |format|
          if @user.save
  
            if division_ids.present?
                division_ids.each do |div_id|
                  user_div = UserDivision.new(
                     user_id:  @user.id,
                     division_id: div_id,
                     active_status: true,
                     del_status: false
                  )
                  user_div.save
                end
  
                if main.present?
                  u_div = UserDivision.where(division_id: main)[0]
                  u_div.update(main: true)
                end
            end
  
            format.html { redirect_to roles_path, notice: 'User was successfully created.' }
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
  
  
    def edit_user_post_cancelled
      respond_to do |format|
        @user = User.find(params["user"]["id"])
        _email = @user.email
        _username = @user.username
        if @user.update(active_status: false, del_status: true)
          
          
          n = User.new
  
          n.prev_id= @user.id
          n.username = _username
          n.role_id = user_params[:role_id]
          n.password = @user.password
          n.entity_id = @user.entity_id
          n.email = _email
          n.active_status = true
          if n.save
              format.html { redirect_to roles_path, notice: 'User  was successfully updated.' }
          end
        
          # format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit_user }
          format.json { render json: @user.errors, status: :unprocessable_entity }
          logger.info "error FOR EDIT USER === #{@user.errors.inspect}"
        end
      end
     end
  
    def get_division
      @entity_id = params[:entity_id]
      logger.info "##################################"
      logger.info "THIS IS THE ENTITY ID #{@entity_id.inspect}"
      logger.info "##################################"
  
      @divisions = EntityDivision.where(entity_id: @entity_id)
      logger.info "Entities #{@divisions.inspect}"
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
  