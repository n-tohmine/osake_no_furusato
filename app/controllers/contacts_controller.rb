class ContactsController < ApplicationController
  skip_before_action :require_login

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render :confirm
    else
      render :new
    end
  end

  def done
    @contact = Contact.new(contact_params)
    if params[:back]
      render :new
    else
      ContactMailer.send_contact_form(@contact).deliver_now
      redirect_to root_path, success: t('defaults.message.done', item: Contact.model_name.human)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
