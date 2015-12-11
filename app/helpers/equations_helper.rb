module EquationsHelper
  def equation_attributes
    {
      'Equation name' => @equation.equ_identifier,
      'Data' => simple_format(@equation.data, {}, sanitize: false)
    }
  end
end
