local lapis = require 'lapis'
local app = lapis.Application()
local get_error = require('utils.error').get_error
app.include = function(self, a) self.__class.include(self, a, nil, self) end

do
	function app.handle_404()
		return {
			status = tonumber(tostring(get_error.endpoint_not_found().errorCode):sub(1,3)),
			json = get_error.endpoint_not_found()
		}
	end
end

app:include('routes')

return app
