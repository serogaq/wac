local ngx = _G.ngx
local action = setmetatable({}, require 'api.internal.action_base')

function action:GET()
    return {
		status = ngx.HTTP_OK,
		json = {
            message = 'Hello from api.tests.test.GET'
        }
	}
end

function action:POST()
    return {
		status = ngx.HTTP_OK,
		json = {
            message = 'Hello from api.tests.test.POST',
            params = self.params
        }
	}
end

return action
