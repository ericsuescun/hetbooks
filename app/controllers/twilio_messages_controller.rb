class TwilioMessagesController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
    @books = Book.where(discipline: @customer.prof_title).where(specialty: @customer.specialty).paginate(page: params[:page], per_page: 10)
  end

  def create
    ts = TwilioService.new

    customer = Customer.find(params[:customer_id])
    cel_number = customer.cel

    body = "#{request.protocol}#{request.host_with_port}/books/#{params[:book_id]}"
    wa_msg_params = { message: body, cel_number: "+57#{cel_number}" }

    wa_message = ts.send_wa_message(wa_msg_params)

    redirect_to "#{request.protocol}#{request.host_with_port}/twilio_messages/#{params[:customer_id]}", notice: wa_message
  end
end
