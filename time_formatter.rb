class TimeFormatter

  DESIGNATION = {'year'=> '%Y', 'month'=> '%m', 'day'=> '%d', 'hour'=> '%H', 'minute'=> '%m', 'second'=> '%S'}

  attr_reader :params

  def initialize(params)
    @params = params.split(',')
  end

  def time
    body = self.params.reduce('') { |body_box, param| body_box << DESIGNATION[param] }
    body = body.split('').join('-')
    Time.now.strftime(body)
  end

<<<<<<< HEAD
  def valid?
    @invalid.empty?
=======
  def invalid_params
    self.params - DESIGNATION.keys
>>>>>>> parent of b45c3af... lesson19fix
  end

  def valid?
    invalid_params.empty?
  end

end
