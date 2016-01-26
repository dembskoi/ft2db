class ResultsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_result, only: [:show, :destroy, :download]

  def index
    @results = Result.all
    authorize Result
  end

  def show
    authorize Result
  end

  def new
    @result = Result.new
    authorize @result
  end

  def create
    @result = Result.new(result_params)
    authorize @result
    if @result.save
      redirect_to @result, notice: "Result '#{@result.name}_#{@result.time}' was created."
    else
      if @result.errors.blank?
        redirect_to results_url, notice: "Result '#{@result.name}_#{@result.time}' was updated."
      else
        render :new
      end
    end
  end

  def destroy
    authorize @result
    @result.destroy
    redirect_to results_url, notice: "Result '#{@result.name}_#{@result.time}' was destroyed."
  end

  def download
    authorize @result
    respond_to do |format|
      format.json do
        send_data render_to_string, type: :json, disposition: 'attachment', filename: "#{@result.name}.json"
      end
    end
  end

  def download_all
    authorize Result
    respond_to do |format|
      format.json do
        send_data render_to_string, type: :json, disposition: 'attachment', filename: "all_results_#{Time.now.iso8601}.json"
      end
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:res, :gas, :type_id, :equation_id, :experiment_id)
  end
end
