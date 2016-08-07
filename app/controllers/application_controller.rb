class ApplicationController < ActionController::API

  before_action :validate_headers

  def validate_headers
    head :unauthorized unless API_TOKEN.eql?(request.headers['Token'])
  end
end
