class TimeFormatter

  DESIGNATION = {'year'=> '%Y', 'month'=> '%m', 'day'=> '%d', 'hour'=> '%H', 'minute'=> '%m', 'second'=> '%S'}

  attr_reader :params

  def initialize(params)
    @params = params.split(',')
    @valid = []
    @invalid = []
  end

  def call
    @params.each do |param|
      if DESIGNATION[param.to_sym]
        @valid << DESIGNATION[param.to_sym]
      else
        @invalid << param
      end
    end
  end

  def valid?
    invalid_params.empty?
  end

  def time
    Time.now.strftime(@valid*"-")
  end

  def invalid_params
    "Unknown time format " + @invalid.to_s
  end
end
