module Twilio
  module REST
    class Messages < ListResource
      def initialize(uri, client)
        super
        # hard-code the json key since 'messages' doesn't exist in the response
        @resource_name = 'sms_messages'
      end
    end
  end
end
