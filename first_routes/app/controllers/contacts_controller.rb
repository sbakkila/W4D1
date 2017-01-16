class ContactsController < ApplicationController

  def index
    render json: [User.find(params[:user_id]).contacts, User.find(params[:user_id]).shared_contacts]
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def update
    render json: Contact.update(params[:id], contact_params)
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to index
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
