module ApiHelper
  def response_body
    JSON.parse response.body
  end

  def response_error
    response_body["error"]
  end

  def response_error_code
    response_error["error_code"]
  end

  def response_error_message
    response_error["error_message"]
  end

  def error_details
    response_error["details"]
  end

  def response_data
    response_body["data"]
  end

  def expect_http_status http_status
    expect(response).to have_http_status(http_status)
  end

  def expect_response_body response_body
    expect(response.body).to eq response_body
  end
end
