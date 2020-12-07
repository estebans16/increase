class Api::V1::ClientsController < ApplicationController
  before_action :set_client, only: [:show, :payments, :transactions]

  # GET /clients
  def index
    render json: Api::V1::Clients::Index.new.call(params)
  end

  # GET /clients/:external_client_id
  def show
    render json: @client
  end

  # GET /clients/:external_client_id/payments
  def payments
    render json: Api::V1::Clients::Payments.new.call(params)
  end

  # GET /clients/:external_client_id/payments/:paymentid/transactions
  def transactions
    render json: Api::V1::Clients::Transactions.new.call(params)
  end

  # GET /clients/:external_client_id/received_money
  def received_money
    render json: Api::V1::Clients::ReceivedMoney.new.call(params)
  end

  # GET /clients/:external_client_id/money_to_receive
  def money_to_receive
    render json: Api::V1::Clients::MoneyToReceive.new.call(params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find_by(external_client_id: params[:external_client_id])
  end

end
