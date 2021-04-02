local config = require("lapis.config")

config({"development", "production"}, {
    port = 443,
    hmac_digest = 'sha256',
    secret = tostring(os.getenv('SECRET')),
    session_name = 'app_sid',
    code_cache = 'on',
    postgres = {
        host = tostring(os.getenv('DB_HOST')),
        user = tostring(os.getenv('DB_USER')),
        password = tostring(os.getenv('DB_PASSWORD')),
        database = tostring(os.getenv('DB_NAME'))
    },
    logs = tonumber(os.getenv('LOGS')),
    app_name = os.getenv('PROJECT_NAME'),
    environment = os.getenv('ENVIRONMENT')
})

if tonumber(os.getenv('LOGS')) == 1 then
    config("development", {
        logging = {
            queries = true,
            requests = true
        },
        measure_performance = true
    })
end

--config("production", {})
