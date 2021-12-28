# frozen_string_literal: true

module RestRequests
  HTTP_SUCCESS_CODES = [200, 201, 202].freeze

  def get(url, headers = {})
    # TODO: this logger MUST be deleted in the future!
    Rails.logger.info("REST::GET_REQUEST::::URL:#{url}")
    RestClient.get(url, headers)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  rescue StandardError => e
    Rails.logger.error([e&.message, nil])
    nil
  end

  def post(url, params = {}, headers = {})
    # TODO: this logger MUST be deleted in the future!
    Rails.logger.info("REST::POST_REQUEST::::URL:#{url}----PARAMS:#{String(params)}")
    RestClient.post(url, params, headers)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  rescue StandardError => e
    Rails.logger.error([e&.message, nil])
    nil
  end

  def put(url, params = {}, headers = {})
    # TODO: this logger MUST be deleted in the future!
    Rails.logger.info("REST::PUT_REQUEST::::URL:#{url}----PARAMS:#{String(params)}")
    RestClient.put(url, params, headers)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  rescue StandardError => e
    Rails.logger.error([e&.message, nil])
    nil
  end

  def delete(url, headers = {})
    # TODO: this logger MUST be deleted in the future!
    Rails.logger.info("REST::DELETE_REQUEST::::URL:#{url}")
    RestClient.delete(url, headers)
  rescue RestClient::ExceptionWithResponse => e
    e.response
  rescue StandardError => e
    Rails.logger.error([e&.message, nil])
    nil
  end

  def json_response(response = nil)
    return if response.blank?

    if response.body.blank?
      {}
    else
      parsed = JSON.parse(response.body)

      if parsed.is_a?(Hash)
        parsed.with_indifferent_access
      else
        parsed
      end
    end
  end
end
