class MessagesController < ApplicationController

  def create
    @message = current_user.send_message(params[:message])
    if @message.new_record?
      flash[:notice] = "The message was saved successfully."
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

    def Message_params
      params.require(:message).permit(:message)
    end
end
