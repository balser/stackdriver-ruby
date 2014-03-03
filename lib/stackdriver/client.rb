require 'stackdriver/client/custom'
require 'stackdriver/client/deploy_event'
require 'stackdriver/client/annotation_event'

module Stackdriver
  #
  # Client for Stackdriver API
  #
  class Client
    include Stackdriver::Client::Custom
    include Stackdriver::Client::DeployEvent
    include Stackdriver::Client::AnnotationEvent

    STACKDRIVER_HOST = 'https://custom-gateway.stackdriver.com'.freeze

    def last_response
      @last_response
    end

    def clear
      @last_response = nil
    end

    private

    def conn
      @conn ||= Faraday.new(url: STACKDRIVER_HOST) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    #
    # Send the metrics/event and return success boolean.
    #
    def request(method, endpoint, data)
      begin
        @last_response = conn.send(method) do |req|
          req.url endpoint
          req.body = MultiJson.dump(data)
          req.headers['Content-Type']         = 'application/json'
          req.headers['x-stackdriver-apikey'] = api_key
          req.options[:timeout]               = 2
          req.options[:open_timeout]          = 2
        end

        # TODO: Confirm whether 201 is the only success response.
        @last_response.status == 201
      rescue
        false
      end
    end

    def api_key
      @api_key ||= ENV.fetch('STACKDRIVER_API_KEY', 'NullApiKey')
    end

  end
end
