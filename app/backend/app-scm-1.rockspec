package = 'app'
version = 'scm-1'

source = {
    url = 'file:///root/app/backend/src',
}

description = {
    summary = 'initial',
    detailed = [[
        Initial
    ]],
    homepage = '',
    license = 'MIT <http://opensource.org/licenses/MIT>'
}

dependencies = {
    'lua >= 5.1',
    'lapis = 1.8.3-1',
}

build = {
    type = 'none',
}
