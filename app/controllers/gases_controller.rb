class GasesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_gas, only: [:show, :edit, :update, :destroy]

  def index
    @gases = Gas.all
    authorize Gas
  end

  def show
    authorize Gas
  end

  def new
    @gas = Gas.new
    authorize @gas
  end

  def edit
    authorize @gas
  end

  def create
    @gas = Gas.new(gas_params)
    authorize @gas
    if @gas.save
      redirect_to @gas, notice: "Gas '#{@gas.name}' was created."
    else
      render :new
    end
  end

  def update
    authorize @gas
    if @gas.update(gas_params)
      redirect_to @gas, notice: "Gas '#{@gas.name}' was updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @gas
    @gas.destroy
    redirect_to gases_url, notice: "Gas '#{@gas.name}' was destroyed."
  end

  private

  def set_gas
    @gas = Gas.find(params[:id])
  end

  def gas_params
    params.require(:gas).permit(:name)
  end
end
