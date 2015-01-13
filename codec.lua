--[[
  
  Copyright (C) 2014 Masatoshi Teruya

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

 
  codec.lua
  lua-codec
  
  Created by Masatoshi Teruya on 14/12/06.
  
--]]

return {
    json = {
        encode = require('cjson.safe').encode,
        decode = require('cjson.safe').decode
    },
    url = {
        encode      = require('url.codec').encodeURI,
        decode      = require('url.codec').decodeURI,
        encode2396  = require('url.codec').encode2396,
        decode2396  = require('url.codec').decode2396,
        encode3986  = require('url.codec').encode3986,
        decode3986  = require('url.codec').decode3986
    },
    base64 = {
        encode      = require('base64mix').encode,
        decode      = require('base64mix').decode,
        encodeURL   = require('base64mix').encodeURL,
        decodeURL   = require('base64mix').decodeURL,
        decodeMix   = require('base64mix').decodeMix
    },
    hex = {
        encode = require('hex').encode,
        decode = require('hex').decode
    },
    idna = {
        encode = require('idna').encode,
        decode = require('idna').decode
    },
    geo = {
        encode = require('geo').encode,
        decode = require('geo').decode
    }
};

