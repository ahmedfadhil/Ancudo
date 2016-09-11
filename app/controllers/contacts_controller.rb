class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = "Success!, Message was saved successfully."
      redirect_to new_contact_path

    else
      flash[:danger] = "Error!, Unexpected Error Occured."
      redirect_to new_contact_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :comment)
  end
end
