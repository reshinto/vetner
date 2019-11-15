class ContactsController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
