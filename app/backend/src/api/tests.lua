local lapis = require 'lapis'
local capture = require('lapis.application').capture_errors_json
local r2 = require('lapis.application').respond_to
local json_params = require("lapis.application").json_params
local handle = require('utils.error').handle
local app = lapis.Application()
app.__base = app
app.name = 'api.tests.'
app.path = '/api/tests'

app:match('test', '', capture({ on_error = handle, json_params(r2(require 'api.tests.test')) }))

return app
