require 'stackdriver/client'

#
# Ruby toolkit for the reporting Stackdriver events and metrics.
#
module Stackdriver

  class << self

    def client
      @client ||= Stackdriver::Client.new
    end

    private

    #
    # Delegate to the Stackdriver::Client.
    #
    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end
