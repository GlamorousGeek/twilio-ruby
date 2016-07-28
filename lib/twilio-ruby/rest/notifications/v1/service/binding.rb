##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Notifications < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class BindingList < ListResource
            ##
            # Initialize the BindingList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [BindingList] BindingList
            def initialize(version, service_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid
              }
              @uri = "/Services/#{@solution[:service_sid]}/Bindings"
            end
            
            ##
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [String] endpoint The endpoint
            # @param [String] identity The identity
            # @param [binding.BindingType] binding_type The binding_type
            # @param [String] address The address
            # @param [String] tag The tag
            # @param [String] notification_protocol_version The notification_protocol_version
            # @return [BindingInstance] Newly created BindingInstance
            def create(endpoint: nil, identity: nil, binding_type: nil, address: nil, tag: nil, notification_protocol_version: nil)
              data = {
                  'Endpoint' => endpoint,
                  'Identity' => identity,
                  'BindingType' => binding_type,
                  'Address' => address,
                  'Tag' => tag,
                  'NotificationProtocolVersion' => notification_protocol_version,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return BindingInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Lists BindingInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @param [String] identity The identity
            # @param [String] tag The tag
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, identity: nil, tag: nil, limit: nil, page_size: nil)
              self.stream(
                  start_date_before: start_date_before,
                  start_date: start_date,
                  start_date_after: start_date_after,
                  end_date_before: end_date_before,
                  end_date: end_date,
                  end_date_after: end_date_after,
                  identity: identity,
                  tag: tag,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams BindingInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @param [String] identity The identity
            # @param [String] tag The tag
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, identity: nil, tag: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  start_date_before: start_date_before,
                  start_date: start_date,
                  start_date_after: start_date_after,
                  end_date_before: end_date_before,
                  end_date: end_date,
                  end_date_after: end_date_after,
                  identity: identity,
                  tag: tag,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields BindingInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @param [String] identity The identity
            # @param [String] tag The tag
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
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [Time] start_date_before The start_date
            # @param [Time] start_date The start_date
            # @param [Time] start_date_after: The start_date
            # @param [Time] end_date_before The end_date
            # @param [Time] end_date The end_date
            # @param [Time] end_date_after: The end_date
            # @param [String] identity The identity
            # @param [String] tag The tag
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of BindingInstance
            def page(start_date_before: nil, start_date: nil, start_date_after: nil, end_date_before: nil, end_date: nil, end_date_after: nil, identity: nil, tag: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'StartDate<' => Twilio.serialize_iso8601(start_date_before),
                  'StartDate' => Twilio.serialize_iso8601(start_date),
                  'StartDate>' => Twilio.serialize_iso8601(start_date_after),
                  'EndDate<' => Twilio.serialize_iso8601(end_date_before),
                  'EndDate' => Twilio.serialize_iso8601(end_date),
                  'EndDate>' => Twilio.serialize_iso8601(end_date_after),
                  'Identity' => identity,
                  'Tag' => tag,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return BindingPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Notifications.V1.BindingList>'
            end
          end
        
          class BindingPage < Page
            ##
            # Initialize the BindingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] service_sid The service_sid
            # @return [BindingPage] BindingPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of BindingInstance
            # @param [Hash] payload Payload response from the API
            # @return [BindingInstance] BindingInstance
            def get_instance(payload)
              return BindingInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Notifications.V1.BindingPage>'
            end
          end
        
          class BindingContext < InstanceContext
            ##
            # Initialize the BindingContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [BindingContext] BindingContext
            def initialize(version, service_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  service_sid: service_sid,
                  sid: sid,
              }
              @uri = "/Services/#{@solution[:service_sid]}/Bindings/#{@solution[:sid]}"
            end
            
            ##
            # Fetch a BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return BindingInstance.new(
                  @version,
                  payload,
                  service_sid: @solution['service_sid'],
                  sid: @solution['sid'],
              )
            end
            
            ##
            # Deletes the BindingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Notifications.V1.BindingContext #{context}>"
            end
          end
        
          class BindingInstance < InstanceResource
            ##
            # Initialize the BindingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [BindingInstance] BindingInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'notification_protocol_version' => payload['notification_protocol_version'],
                  'endpoint' => payload['endpoint'],
                  'identity' => payload['identity'],
                  'binding_type' => payload['binding_type'],
                  'address' => payload['address'],
                  'tags' => payload['tags'],
                  'url' => payload['url'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'service_sid' => service_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [BindingContext] BindingContext for this BindingInstance
            def context
              unless @instance_context
                @instance_context = BindingContext.new(
                    @version,
                    @params['service_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def sid
              @properties['sid']
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def service_sid
              @properties['service_sid']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def notification_protocol_version
              @properties['notification_protocol_version']
            end
            
            def endpoint
              @properties['endpoint']
            end
            
            def identity
              @properties['identity']
            end
            
            def binding_type
              @properties['binding_type']
            end
            
            def address
              @properties['address']
            end
            
            def tags
              @properties['tags']
            end
            
            def url
              @properties['url']
            end
            
            ##
            # Fetch a BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              context.fetch
            end
            
            ##
            # Deletes the BindingInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Notifications.V1.BindingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end