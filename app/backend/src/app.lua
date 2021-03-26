local lapis = require("lapis")
local app = lapis.Application()

app:get("/api", function()
  return "Welcome to Lapis " .. require("lapis.version")
end)

return app
