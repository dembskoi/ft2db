class ExperimentsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  before_action :set_experiment, only: [:show, :destroy, :download]

  def index
    @experiments = Experiment.all
    authorize Experiment
  end

  def show
    authorize Experiment
  end

  def new
    @experiment = Experiment.new
    authorize @experiment
  end

  def create
    @experiment = Experiment.new(experiment_params)
    authorize @experiment
    if @experiment.save
      redirect_to @experiment, notice: "Experiment '#{@experiment.exp_identifier}' was created."
    else
      render :new
    end
  end

  def destroy
    authorize @experiment
    @experiment.destroy
    redirect_to experiments_url, notice: "Experiment '#{@experiment.exp_identifier}' was destroyed."
  end

  def download
    authorize @experiment
    send_file(@experiment.exp.current_path, disposition: 'attachment')
  end

  private

  def set_experiment
    @experiment = Experiment.find(params[:id])
  end

  def experiment_params
    params.require(:experiment).permit(:exp)
  end
end
