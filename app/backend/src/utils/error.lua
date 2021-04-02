local ngx = _G.ngx
local get_error = {}

-- Global

function get_error.endpoint_not_found()
	return { errorCode = 4040, message = 'Endpoint Not Found' }
end

-- Authorization

-- email:api_key format in Authorization HTTP header is invalid
function get_error.malformed_authorization()
	return { errorCode = 4010 }
end

-- email:api_key in Authorization HTTP header does not match any user
-- login credentials do not match any user
function get_error.invalid_authorization()
	return { errorCode = 4010 }
end

-- Attempting to access endpoint that requires higher priviliges
function get_error.unauthorized_access()
	return { errorCode = 4010 }
end

-- Data Validation

function get_error.field_not_found(field)
	return { errorCode = 4010, field = field }
end
function get_error.field_invalid(field)
	return { errorCode = 4010, field = field }
end
function get_error.field_not_unique(field)
	return { errorCode = 4010, field = field }
end
function get_error.token_expired(field)
	return { errorCode = 4010, field = field }
end
function get_error.password_not_match()
	return { errorCode = 4010 }
end

-- Database I/O

function get_error.database_unresponsive()
	return { errorCode = 4010 }
end
function get_error.database_create()
	return { errorCode = 4010 }
end
function get_error.database_modify()
	return { errorCode = 4010 }
end
function get_error.database_delete()
	return { errorCode = 4010 }
end
function get_error.database_select()
	return { errorCode = 4010 }
end

return {
	get_error = get_error,
	handle = function(self)
		local error = {
			status = tonumber(tostring(self.errors[1].httpCode):sub(1,3)),
			json = self.errors
		}
		return self:write(error)
	end
}
