# A Savon Client for DFA
class DFAClient
  require 'savon'
  require 'net/http'

  def initialize(version = 'v1.19')
    @namespace = "http://www.doubleclick.net/dfa-api/#{version}"
    @baseurl = "https://advertisersapi.doubleclick.com/#{version}/api/dfa-api/"
    @token = nil
    @last_response = nil
  end

  # Authenticate with the DFA soap service.
  def authenticate(username = nil, password = nil)
    @username = username
    @password = password
    response = self.request('login', :authenticate, {username: @username, password: @password})
    @token = response[:token]
  end

  #Do we have a token?
  def connected?
    @token
  end

  # Make a request to the DFA API.
  def request(endpoint = '', method='', params = {}, raw = false)
    client = Savon.client(wsdl: "#{@baseurl}#{endpoint}?wsdl") do |locals|
      locals.wsse_auth(@username, @token) if @token
    end
    @last_response = client.call(method, message: params)

    # Return data or handle exceptions.
    @last_response.success? ? (raw ? @last_response : @last_response.to_hash[:multi_ref]) : error(@last_response)
  end

  # Handle soap and http errors.
  def error(response)
    throw response.http_error? ? response.http_error : response.soap_fault
  end
end
