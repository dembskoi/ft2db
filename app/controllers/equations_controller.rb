class EquationsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_equation, only: [:show, :destroy, :download]

  def index
    @equations = Equation.all
    authorize Equation
  end

  def show
    authorize Equation
  end

  def new
    @equation = Equation.new
    authorize @equation
  end

  def create
    @equation = Equation.new(equation_params)
    authorize @equation
    if @equation.save
      redirect_to @equation, notice: "Equation '#{@equation.equ_identifier}' was created."
    else
      render :new
    end
  end

  def destroy
    authorize @equation
    @equation.destroy
    redirect_to equations_url, notice: "Equation '#{@equation.equ_identifier}' was destroyed."
  end

  def download
    authorize @equation
    send_file(@equation.equ.current_path, disposition: 'attachment')
  end

  private

  def set_equation
    @equation = Equation.find(params[:id])
  end

  def equation_params
    params.require(:equation).permit(:equ)
  end
end
