require 'sinatra'
require 'sinatra/namespace'

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/*' do
    path = "no path"
    vars = {}
    status = 200
    params.each do |key, val|
      if key == 'splat'
        path = val.first
      elsif key == 'status'
        status = val
      else
        vars[key] = val
      end
    end
    {status: status, path: path, vars: vars}.to_json
  end
end
