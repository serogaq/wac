local lapis = require("lapis")
local app = lapis.Application()

app:get('/api', function(self)
    return { json = self.req.headers }
end)

return app
