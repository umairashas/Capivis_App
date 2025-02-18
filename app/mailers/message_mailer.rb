class MessageMailer < ApplicationMailer
    default from: 'no-reply@example.com'
  
    def new_message(message)
      @message = message
      mail(to: 'umairashas@gmail.com', subject: 'New Message Received')
    end
  end