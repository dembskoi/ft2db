module ResultsHelper
  def result_attributes
    {
      'Name' => @result.name,
      'Time' => @result.time,
      'Gas' => link_to(@result.gas.name, @result.gas),
      'Type' => link_to(@result.type.name, @result.type),
      'Equation' => @result.equation ? link_to(@result.equation.equ_identifier, @result.equation) : '',
      'Experiment' => @result.experiment ? link_to(@result.experiment.exp_identifier, @result.experiment) : ''
    }
  end

  def standard_data
    st = []
    @result.standard_data.each do |k, v|
      st << "<strong>#{k}</strong>=#{v}"
    end

    st.join('&nbsp&nbsp&nbsp&nbsp')
  end

end
