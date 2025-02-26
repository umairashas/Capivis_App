class MessagesController < ApplicationController
    before_action :authenticate_user!

    def index
        @messages = Message.all
    end
  
    def new
      @message = Message.new
    end
  
    def create
      @message = Message.new(message_params)
      if @message.save
        MessageMailer.new_message(@message).deliver_now
        redirect_to contact_path, notice: "Your message has been sent successfully."
      else
        render :new
      end
    end
  
    private
  
    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
  end