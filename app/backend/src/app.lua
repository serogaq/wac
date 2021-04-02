local lapis = require 'lapis'
local app = lapis.Application()
app.include = function(self, a) self.__class.include(self, a, nil, self) end

app:include('routes')

return app
