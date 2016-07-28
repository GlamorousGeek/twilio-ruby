##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Monitor < Domain
      class V1 < Version
        class EventList < ListResource
          ##
          # Initialize the EventList
          # @param [Version] version Version that contains the resource
          # @return [EventList] EventList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Events"
          end
          
          ##
          # Lists EventInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] actor_sid The actor_sid
          # @param [Time] end_date_before The end_date
          # @param [Time] end_date The end_date
          # @param [Time] end_date_after: The end_date
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Time] start_date_before The start_date
          # @param [Time] start_date The start_date
          # @param [Time] start_date_after: The start_date
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(actor_sid: nil, end_date_before: nil, end_date: nil, end_date_after: nil, event_type: nil, resource_sid: nil, source_ip_address: nil, start_date_before: nil, start_date: nil, start_date_after: nil, limit: nil, page_size: nil)
            self.stream(
                actor_sid: actor_sid,
                end_date_before: end_date_before,
                end_date: end_date,
                end_date_after: end_date_after,
                event_type: event_type,
                resource_sid: resource_sid,
                source_ip_address: source_ip_address,
                start_date_before: start_date_before,
                start_date: start_date,
                start_date_after: start_date_after,
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          ##
          # Streams EventInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] actor_sid The actor_sid
          # @param [Time] end_date_before The end_date
          # @param [Time] end_date The end_date
          # @param [Time] end_date_after: The end_date
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Time] start_date_before The start_date
          # @param [Time] start_date The start_date
          # @param [Time] start_date_after: The start_date
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(actor_sid: nil, end_date_before: nil, end_date: nil, end_date_after: nil, event_type: nil, resource_sid: nil, source_ip_address: nil, start_date_before: nil, start_date: nil, start_date_after: nil, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                actor_sid: actor_sid,
                end_date_before: end_date_before,
                end_date: end_date,
                end_date_after: end_date_after,
                event_type: event_type,
                resource_sid: resource_sid,
                source_ip_address: source_ip_address,
                start_date_before: start_date_before,
                start_date: start_date,
                start_date_after: start_date_after,
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          ##
          # When passed a block, yields EventInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] actor_sid The actor_sid
          # @param [Time] end_date_before The end_date
          # @param [Time] end_date The end_date
          # @param [Time] end_date_after: The end_date
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Time] start_date_before The start_date
          # @param [Time] start_date The start_date
          # @param [Time] start_date_after: The start_date
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page,
                            limit: limits['limit'],
                            page_limit: limits['page_limit']).each {|x| yield x}
          end
          
          ##
          # Retrieve a single page of EventInstance records from the API.
          # Request is executed immediately.
          # @param [String] actor_sid The actor_sid
          # @param [Time] end_date_before The end_date
          # @param [Time] end_date The end_date
          # @param [Time] end_date_after: The end_date
          # @param [String] event_type The event_type
          # @param [String] resource_sid The resource_sid
          # @param [String] source_ip_address The source_ip_address
          # @param [Time] start_date_before The start_date
          # @param [Time] start_date The start_date
          # @param [Time] start_date_after: The start_date
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of EventInstance
          def page(actor_sid: nil, end_date_before: nil, end_date: nil, end_date_after: nil, event_type: nil, resource_sid: nil, source_ip_address: nil, start_date_before: nil, start_date: nil, start_date_after: nil, page_token: nil, page_number: nil, page_size: nil)
            params = {
                'ActorSid' => actor_sid,
                'EndDate<' => Twilio.serialize_iso8601(end_date_before),
                'EndDate' => Twilio.serialize_iso8601(end_date),
                'EndDate>' => Twilio.serialize_iso8601(end_date_after),
                'EventType' => event_type,
                'ResourceSid' => resource_sid,
                'SourceIpAddress' => source_ip_address,
                'StartDate<' => Twilio.serialize_iso8601(start_date_before),
                'StartDate' => Twilio.serialize_iso8601(start_date),
                'StartDate>' => Twilio.serialize_iso8601(start_date_after),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return EventPage.new(@version, response, @solution)
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Monitor.V1.EventList>'
          end
        end
      
        class EventPage < Page
          ##
          # Initialize the EventPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [EventPage] EventPage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of EventInstance
          # @param [Hash] payload Payload response from the API
          # @return [EventInstance] EventInstance
          def get_instance(payload)
            return EventInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Monitor.V1.EventPage>'
          end
        end
      
        class EventContext < InstanceContext
          ##
          # Initialize the EventContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [EventContext] EventContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Events/#{@solution[:sid]}"
          end
          
          ##
          # Fetch a EventInstance
          # @return [EventInstance] Fetched EventInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return EventInstance.new(
                @version,
                payload,
                sid: @solution['sid'],
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Monitor.V1.EventContext #{context}>"
          end
        end
      
        class EventInstance < InstanceResource
          ##
          # Initialize the EventInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [EventInstance] EventInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'actor_sid' => payload['actor_sid'],
                'actor_type' => payload['actor_type'],
                'description' => payload['description'],
                'event_data' => payload['event_data'],
                'event_date' => Twilio.deserialize_iso8601(payload['event_date']),
                'event_type' => payload['event_type'],
                'resource_sid' => payload['resource_sid'],
                'resource_type' => payload['resource_type'],
                'sid' => payload['sid'],
                'source' => payload['source'],
                'source_ip_address' => payload['source_ip_address'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [EventContext] EventContext for this EventInstance
          def context
            unless @instance_context
              @instance_context = EventContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def actor_sid
            @properties['actor_sid']
          end
          
          def actor_type
            @properties['actor_type']
          end
          
          def description
            @properties['description']
          end
          
          def event_data
            @properties['event_data']
          end
          
          def event_date
            @properties['event_date']
          end
          
          def event_type
            @properties['event_type']
          end
          
          def resource_sid
            @properties['resource_sid']
          end
          
          def resource_type
            @properties['resource_type']
          end
          
          def sid
            @properties['sid']
          end
          
          def source
            @properties['source']
          end
          
          def source_ip_address
            @properties['source_ip_address']
          end
          
          ##
          # Fetch a EventInstance
          # @return [EventInstance] Fetched EventInstance
          def fetch
            context.fetch
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Monitor.V1.EventInstance #{values}>"
          end
        end
      end
    end
  end
end