#
# See:
#   http://feedback.stackdriver.com/knowledgebase/articles/260455-sending-annotation-events-to-stackdriver
#
module Stackdriver
  class Client
    module AnnotationEvent

      ENDPOINT = 'v1/annotationevent'.freeze

      #
      # Options:
      #   :level (INFO/WARN/ERROR, default INFO)
      #   :annotated_by
      #   :instance_id
      #   :event_epoch
      #
      def annotation_event(message, options={})
        data = {
          message: message,
        }.merge(options)

        request(:post, ENDPOINT, data)
      end

    end
  end
end
