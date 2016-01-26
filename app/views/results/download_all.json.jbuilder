Result.all.each do |result|
  json.set! "#{result.name}_#{result.time}" do
    json.type result.type.name
    json.equation result.equation.equ_identifier if result.equation
    json.experiment result.experiment.exp_identifier if result.experiment
    json.standard_data result.standard_data
    json.scalar_data result.scalar_data
    json.vector_data result.vector_data
  end
end