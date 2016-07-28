##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Lookups < Domain
      class V1 < Version
        class PhoneNumberList < ListResource
          ##
          # Initialize the PhoneNumberList
          # @param [Version] version Version that contains the resource
          # @return [PhoneNumberList] PhoneNumberList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Lookups.V1.PhoneNumberList>'
          end
        end
      
        class PhoneNumberPage < Page
          ##
          # Initialize the PhoneNumberPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [PhoneNumberPage] PhoneNumberPage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of PhoneNumberInstance
          # @param [Hash] payload Payload response from the API
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def get_instance(payload)
            return PhoneNumberInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Lookups.V1.PhoneNumberPage>'
          end
        end
      
        class PhoneNumberContext < InstanceContext
          ##
          # Initialize the PhoneNumberContext
          # @param [Version] version Version that contains the resource
          # @param [String] phone_number The phone_number
          # @return [PhoneNumberContext] PhoneNumberContext
          def initialize(version, phone_number)
            super(version)
            
            # Path Solution
            @solution = {
                phone_number: phone_number,
            }
            @uri = "/PhoneNumbers/#{@solution[:phone_number]}"
          end
          
          ##
          # Fetch a PhoneNumberInstance
          # @param [String] country_code The country_code
          # @param [String] type The type
          # @param [String] add_ons The add_ons
          # @param [Hash] add_ons_data The add_ons_data
          # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
          def fetch(country_code: nil, type: nil, add_ons: nil, add_ons_data: nil)
            params = {
                'CountryCode' => country_code,
                'Type' => type,
                'AddOns' => add_ons,
            }
            
            params.merge!(Twilio.prefixed_collapsible_map(add_ons_data, 'AddOns'))
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return PhoneNumberInstance.new(
                @version,
                payload,
                phone_number: @solution['phone_number'],
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Lookups.V1.PhoneNumberContext #{context}>"
          end
        end
      
        class PhoneNumberInstance < InstanceResource
          ##
          # Initialize the PhoneNumberInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] phone_number The phone_number
          # @return [PhoneNumberInstance] PhoneNumberInstance
          def initialize(version, payload, phone_number: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'country_code' => payload['country_code'],
                'phone_number' => payload['phone_number'],
                'national_format' => payload['national_format'],
                'carrier' => payload['carrier'],
                'add_ons' => payload['add_ons'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'phone_number' => phone_number || @properties['phone_number'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [PhoneNumberContext] PhoneNumberContext for this PhoneNumberInstance
          def context
            unless @instance_context
              @instance_context = PhoneNumberContext.new(
                  @version,
                  @params['phone_number'],
              )
            end
            @instance_context
          end
          
          def country_code
            @properties['country_code']
          end
          
          def phone_number
            @properties['phone_number']
          end
          
          def national_format
            @properties['national_format']
          end
          
          def carrier
            @properties['carrier']
          end
          
          def add_ons
            @properties['add_ons']
          end
          
          ##
          # Fetch a PhoneNumberInstance
          # @param [String] country_code The country_code
          # @param [String] type The type
          # @param [String] add_ons The add_ons
          # @param [Hash] add_ons_data The add_ons_data
          # @return [PhoneNumberInstance] Fetched PhoneNumberInstance
          def fetch(country_code: nil, type: nil, add_ons: nil, add_ons_data: nil)
            context.fetch(
                country_code: country_code,
                type: type,
                add_ons: add_ons,
                add_ons_data: add_ons_data,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Lookups.V1.PhoneNumberInstance #{values}>"
          end
        end
      end
    end
  end
end