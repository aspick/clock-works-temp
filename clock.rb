require 'net/http'
require 'clockwork'
include Clockwork

HTTP_HOST = 'www.example.com'
HTTP_PATH = '/path/to/call'

handler do |job|
  #puts "Running #{job}"

	if job == 'frequent.run' then
    	Net::HTTP.start(HTTP_HOST) do |http|
      		response = http.get(HTTP_PATH)
      		puts response
    	end
	end

end

every(40.seconds, 'frequent.run')
