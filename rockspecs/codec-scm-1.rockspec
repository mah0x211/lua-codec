package = "codec"
version = "scm-1"
source = {
    url = "git://github.com/mah0x211/lua-codec.git"
}
description = {
    summary = "encode/decode module.",
    homepage = "https://github.com/mah0x211/lua-codec", 
    license = "MIT/X11",
    maintainer = "Masatoshi Teruya"
}
dependencies = {
    "lua >= 5.1",
    "lua-cjson >= 2.1.0",
    "url >= 1.0.1",
    "base64mix >= 1.0.0"
}
build = {
    type = "builtin",
    modules = {
        codec = "codec.lua"
    }
}

