#
# http://feedback.stackdriver.com/knowledgebase/articles/212917-sending-code-deploy-events-to-stackdriver
#
module Stackdriver
  class Client
    module DeployEvent

      ENDPOINT = 'v1/deployevent'

      #
      # Options:
      #   :deployed_by
      #   :deployed_to
      #   :repository
      #
      def deploy_event(revision_id, options={})
        data = {
          revision_id: revision_id,
        }.merge(options)

        request(:post, ENDPOINT, data)
      end

    end
  end
end
