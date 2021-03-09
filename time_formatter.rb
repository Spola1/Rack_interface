class TimeFormatter

  DESIGNATION = {'year'=> '%Y', 'month'=> '%m', 'day'=> '%d', 'hour'=> '%H', 'minute'=> '%m', 'second'=> '%S'}

  def initialize(params)
    @params = params.split(',')
  end

  def time
    body = self.params.reduce('') { |body_box, param| body_box << DESIGNATION[param] }
    body = body.split('').join('-')
    Time.now.strftime(body)
  end

  def valid?
    @invalid.empty?
  end

  def valid?
    invalid_params.empty?
  end

end
