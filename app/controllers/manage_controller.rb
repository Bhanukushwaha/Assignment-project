class ManageController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.password = 12345678
    respond_to do |format|
      if @user.save
        Profile.create(:image=> params[:user][:image], :imagable_id=> @user.id, :imagable_type=> "User")

        format.html { redirect_to "/manage", notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)

        if @user.profiles.last.present?
          @user.profiles.last.update(:image=> params[:user][:image], :imagable_id=> @user.id, :imagable_type=> "User")
        else
          @user.profiles.create
          @user.profiles.last.update(:image=> params[:user][:image_id], :imagable_id=> @user.id, :imagable_type=> "User")
        end
        format.html { redirect_to manage_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to manage_index_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name , :last_name, :email, :company_id,:monthly_charge, :role_id, :start_date, :end_date, :notes, :active)
    end
end
