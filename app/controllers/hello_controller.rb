class HelloController < ApplicationController
  skip_before_action :verify_authenticity_token

  layout "hello"
  @@contacts = []

  def initialize
    super
    @header = "Hello page"
    @footer = "copyright MASATO-komukai 2026."
    @title = "ActiveModel Sample"
  end

  def index
    @contacts = @@contacts

    if request.post?
      @contact = Contact.new(contact_params)
      if @contact.valid?
        @msg = "Contact data has been registered."
        @contacts << @contact
        redirect_to action: "index", title: @title, msg: @msg
      else
        @msg = "Contact data has not been registered!!"
        render :index, status: :unprocessable_entity
      end
    else
      @contact = Contact.new()
      @msg = params[:msg] ? params[:msg] : "Please input name & email:"
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end
end
