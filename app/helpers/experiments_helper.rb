module ExperimentsHelper
  def experiment_attributes
    {
      'Experiment name' => @experiment.exp_identifier,
      'Data' => simple_format(@experiment.data, {}, sanitize: false)
    }
  end
end
