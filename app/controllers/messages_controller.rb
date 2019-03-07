class MessagesController < ApplicationController
  def index
    messages = Message.where(sender: current_user)
    messages += Message.where(receiver: current_user)
    messages.sort_by! { |message| message.created_at }
    @conversations_with = []
    messages.each do |message|
      if message.sender == current_user && check_user_in(@conversations_with, message.receiver)
        @conversations_with.push([message.receiver, message.created_at, message.status])
      elsif message.receiver == current_user && check_user_in(@conversations_with, message.sender)
        @conversations_with.push([message.sender, message.created_at, message.status])
      end
    end
    p "-"*60
    p @conversations_with
  end

  def check_user_in(array_of_ar, user)
    result = true
    array_of_ar.each do |array|
      result = false if array.include?(user)
    end
    result
  end

  def show
    @sender = current_user
    @receiver = User.find(params[:id])
    @messages_received = @sender.received_messages.where(sender: @receiver)
    @messages_sent = @sender.sent_messages.where(receiver: @receiver)
    @messages = @messages_sent + @messages_received
    @messages.sort_by! { |message| message.created_at }
    @messages.reverse!
    @new_message = Message.new
  end

  def create
    @new_message = Message.new(check_message_params)
    @new_message.sender = current_user
    if @new_message.save
      redirect_to message_path(@new_message.receiver.id)
    else
      redirect_to message_path(@new_message.receiver.id)
    end
  end

  private

  def check_message_params
    params.require(:message).permit(:content, :subject, :receiver_id)
  end
end
