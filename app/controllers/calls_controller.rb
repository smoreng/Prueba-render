class CallsController < ApplicationController
before_action :authenticate_user!
before_action :set_client
before_action :set_call, only: %i[show edit update destroy]

def index
  @calls = @client.calls

  if params[:search].present?
    @calls = @calls.joins(:reason).where("reasons.name ILIKE ?", "%#{params[:search]}%")
  end
end

def show; end

def new
  @call = @client.calls.build
  @reasons = Reason.all
end

def edit; end

def create
  @call = @client.calls.build(call_params) # Aquí se establece automáticamente el client_id

  if @call.save
    redirect_to client_calls_path(@client), notice: "Llamado creado exitosamente."
  else
    @reasons = Reason.all
    render :new, status: :unprocessable_entity
  end
end

def update
  if @call.update(call_params)
    redirect_to client_call_path(@client, @call), notice: "Llamado actualizado exitosamente."
  else
    @reasons = Reason.all
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @call.destroy
  redirect_to client_calls_path(@client), notice: "Llamado eliminado exitosamente."
end

private

def set_client
  @client = Client.find(params[:client_id])
end

def set_call
  @call = @client.calls.find(params[:id])
end

def call_params
  params.require(:call).permit(:reason_id, :date)
end
end