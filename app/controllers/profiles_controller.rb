class ProfilesController < ApplicationController

  def new
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile
  end

  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
      if @profile.save
        flash[:success] = "Profile has been updated!"
        redirect_to user_path( params[:user_id] )
      else
        render action: :new
      end
    end
end
