class CandidaturesController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message. Nous vous recontacterons rapidement!'
    else
      flash.now[:error] = "Suite à une erreur, votre message n'a pas été envoyé."
      render :new
    end
    
  end
end