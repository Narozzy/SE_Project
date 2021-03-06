class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all.where('to_id=:this_user_id', :this_user_id => current_user.id)
    @sent_messages = Message.all.where('from_id=:this_user_id', :this_user_id => current_user.id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    # In show view, make it so we loop through this message for each one connected
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message[:from_id] = current_user.id
    respond_to do |format|
      if @message.save
        if @message[:prevmsg]
          redirect_path = '/messages/%d' % [@message[:prevmsg]]
        else
          redirect_path = '/messages/%d' % [@message[:id]]
        end
        format.html { redirect_to redirect_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:to_id, :from_id, :listing_id, :content, :prevmsg)
    end
end
