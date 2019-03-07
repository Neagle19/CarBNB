class MessagesController < ApplicationController
  def index
  end

  def show
    @sender = current_user
    @receiver = User.find(params[:id])
    @messages_received = @sender.received_messages.where(sender: @receiver)
    @messages_sent = @sender.sent_messages.where(receiver: @receiver)
    @messages = @messages_sent + @messages_received
    puts @messages
    @new_message = Message.new
  end

  def create
    @new_message = Message.new(check_message_params)
    @new_message.sender = current_user
    puts "-"*60
    puts @new_message.receiver
  end

private

  def check_message_params
    params.require(:message).permit(:content, :subject, :receiver_id, :receiver)
  end

end
