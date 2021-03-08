require_relative 'time_formatter'

class App

  def call(env)
    request = Rack::Request.new(env)
    params = request.params["format"]

    if request.path == '/time' && params
      process_params(params)
    else
      response("unknown path", 404)
    end
  end

  private

  def response(body, status)
    header = {"Content-Type" => "text/plain"}
    Rack::Response.new(body, status, header).finish
  end

  def process_params(params)
     tf = TimeFormatter.new(params.split(','))
     tf.call

     if tf.valid?
       response(tf.time, 200)
     else
       response(tf.invalid_params, 400)
     end
   end
end
