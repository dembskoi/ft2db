module ResultsHelper
  def result_attributes
    {
      'Name' => @result.name,
      'Time' => @result.time,
      'Gas' => @result.gas,
      'Type' => link_to(@result.type.name, @result.type),
      'Equation' => @result.equation ? link_to(@result.equation.equ_identifier, @result.equation) : '',
      'Experiment' => @result.experiment ? link_to(@result.experiment.exp_identifier, @result.experiment) : '',
      'Standard Data' => @result.standard_data,
      'Scalar Data' => @result.scalar_data,
      'Vector Data' => @result.vector_data
    }
  end
end
