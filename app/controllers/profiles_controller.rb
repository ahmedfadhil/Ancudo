class ProfilesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @profile = @user.build_profile
  end

  def create
    @user = User.find(params[:user_id])
    @profile = @user.build_profile(profile_params)

    if @profile.save
      flash[:success]="The profile was created successfully!"
      redirect_to user_path(params[:user_id])
    else
      flash[:danger]="An error has occurred."
      render action: :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end
