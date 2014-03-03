#
# See: http://feedback.stackdriver.com/knowledgebase/articles/181488-sending-custom-application-metrics-to-the-stackdri
#
module Stackdriver
  class Client
    module Custom

      ENDPOINT = 'v1/custom'.freeze

      def custom(name, value, collected_at=Time.now.to_i, instance=nil)
        data_point = {
          name:         name,
          value:        value,
          collected_at: collected_at,
          instance:     instance,
        }

        request(:post, ENDPOINT, gateway_message(data_point))
      end

      #
      # Wraps the datapoint per doc.
      #
      def gateway_message(data)
        {
          data: data,
          timestamp: Time.now.to_i,
          proto_version: 1,
        }
      end

    end
  end
end
