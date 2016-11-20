class WelcomeController < ApplicationController
  def index
  end

  def family
  end

  def about
  end

  def newborns
  end

  def toddlers
  end

  def maternity
  end

  def landscapes
  end

  def city
  end

  def engagements
  end

  def weddings
  end

  def seniors
  end

  def events
  end

  def minisessions
  end

  def testimonials
  end

  def pricing
  end

  def contact_me
  end

  def contact
    ContactMailer.contact_form(params[:name], params[:email], params[:phone], params[:question]).deliver_now

    redirect_to root_path, notice: "Great!  We will get back to you shortly."
  end

end
