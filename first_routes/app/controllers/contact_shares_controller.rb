class ContactSharesController < ApplicationController



  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
        json: contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end



  def destroy
    ContactShare.find(params[:id]).destroy
    redirect_to index
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end

end
