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
    cel_number_data = "+57#{cel_number}"
    message = "#{body} no enviado a #{cel_number_data}"

    if cel_number.present? && cel_number.size == 10

      wa_msg_params = { message: body, cel_number: cel_number }

      wa_message = ts.send_wa_message(wa_msg_params)
      message = wa_message.status
    end

    redirect_to "#{request.protocol}#{request.host_with_port}/twilio_messages/#{params[:customer_id]}", notice: "Estado del mensaje: #{message}"
  end
end
