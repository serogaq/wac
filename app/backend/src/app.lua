local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()
local json_params = require("lapis.application").json_params

local function checkIsJsonValid(self)
    if self.json == nil then
        local errorResponse = {
            ok = false,
            errorCode = 4001
        }
        if os.getenv("DEV") == 1 then errorResponse.message = 'Сan not parse json' end
        self:write({
            json = errorResponse,
            status = 400
        })
    end
end

app:get('/api/test', function(self)
    self:write({ json = config })
end)

app:post('/api/test', json_params(function(self)
    checkIsJsonValid(self)
    self:write({ json = self.json })
end))

app:match('/api/*', function(self)
    self:write({
        json = { message = 'API endpoint not found'},
        status = 404
    })
end)

return app
