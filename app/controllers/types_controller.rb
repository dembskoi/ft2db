class TypesController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    @types = Type.all
    authorize Type
  end

  def show
    authorize Type
  end

  def new
    @type = Type.new
    authorize @type
  end

  def edit
    authorize @type
  end

  def create
    @type = Type.new(type_params)
    authorize @type
    if @type.save
      redirect_to @type, notice: "Type '#{@type.name}' was created."
    else
      render :new
    end
  end

  def update
    authorize @type
    if @type.update(type_params)
      redirect_to @type, notice: "Type '#{@type.name}' was updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @type
    @type.destroy
    redirect_to types_url, notice: "Type '#{@type.name}' was destroyed."
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name)
  end
end
