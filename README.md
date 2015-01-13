lua-codec
=========

encoding and decoding module collection.

---

## Dependencies

- url: https://github.com/mah0x211/lua-url
- base64mix: https://github.com/mah0x211/lua-base64mix
- geo: https://github.com/mah0x211/lua-geo
- hex: https://github.com/mah0x211/lua-hex
- idna: https://github.com/mah0x211/lua-idna
- lua-cjson: http://www.kyne.com.au/~mark/software/lua-cjson.php


## Installation

```sh
luarocks install codec --from=http://mah0x211.github.io/rocks/
```


## codec.url module

please refer to url module documentation - https://github.com/mah0x211/lua-url - for more details.

### Encode

- `str, err = url.encode( src:string )`
- `str, err = url.encode2396( src:string )`
- `str, err = url.encode3986( src:string )`

```lua
local url = require('codec').url;
local src =[[ !"#$%&\'()*+,-./\n
0123456789
:;<=>?@
ABCDEFGHIJKLMNOPQRSTUVWXYZ
[\]^_`
abcdefghijklmnopqrstuvwxyz
{|}~]];
local enc, err = url.encode( src );
print( enc ); 
--[[%20!%22#$%25&%5C'()*+,-./%5Cn%0A0123456789%0A:;%3C=%3E?@%0AABCDEFGHIJKLMNOPQRSTUVWXYZ%0A%5B%5C%5D%5E_%60%0Aabcdefghijklmnopqrstuvwxyz%0A%7B%7C%7D~]]
```

### Decode

- `str, err = url.decode( src:string )`
- `str, err = url.decode2396( src:string )`
- `str, err = url.decode3986( src:string )`

```lua
local url = require('codec').url;
local src = [[%20!%22#$%25&%5C'()*+,-./%5Cn%0A0123456789%0A:;%3C=%3E?@%0AABCDEFGHIJKLMNOPQRSTUVWXYZ%0A%5B%5C%5D%5E_%60%0Aabcdefghijklmnopqrstuvwxyz%0A%7B%7C%7D~]];
local dec, err = url.decode( src );
print( dec ); 
--[[ !"#$%&\'()*+,-./\n
0123456789
:;<=>?@
ABCDEFGHIJKLMNOPQRSTUVWXYZ
[\]^_`
abcdefghijklmnopqrstuvwxyz
{|}~]]
```


## codec.base64 module

please refer to base64mix module documentation - https://github.com/mah0x211/lua-base64mix - for more details.

### Encode

- `str, err = base64.encode( src:string )`
- `str, err = base64.encodeURL( src:string )`


```lua
local base64 = require('codec').base64;
local src = 'hello world';
local enc, err = base64.encode( src );
print( enc ); -- 'aGVsbG8gd29ybGQ='
```

### Decode

- `str, err = base64.decode( src:string )`
- `str, err = base64.decodeURL( src:string )`
- `str, err = base64.decodeMix( src:string )`

```lua
local base64 = require('codec').base64;
local src = 'aGVsbG8gd29ybGQ=';
local dec, err = base64.decode( src );
print( dec ); -- 'hello world'
```

## codec.hex module

please refer to hex module documentation - https://github.com/mah0x211/lua-hex - for more details.

### Encode

- `str, err = hex.encode( src:string )`

```lua
local hex = require('codec').hex;
local src = [[ !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~]];
local enc, err = hex.encode( src );
print( enc ); -- 202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e
```

### Decode

- `str, err = hex.decode( src:string )`

```lua
local hex = require('codec').hex;
local src = '202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e';
local dec, err = hex.decode( src );
print( dec ); 
--[[ !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
]]
```


## codec.idna module

please refer to idna module documentation - https://github.com/mah0x211/lua-idna - for more details.

### Encode

- `str, err = idna.encode( src:string )`

```lua
local idna = require('codec').idna;
local src = '日本語.jp';
local enc, err = idna.encode( src );
print( enc ); -- 'xn--wgv71a119e.jp'
```

### Decode

- `str, err = idna.decode( src:string )`

```lua
local idna = require('codec').idna;
local src = 'xn--wgv71a119e.jp';
local dec, err = idna.decode( src );
print( dec ); -- '日本語.jp'
```

```lua
local idna = require('codec').idna;
local src = 'xn--wgv71a119e.jp';
local dec, err = idna.decode( src );
print( dec ); -- '日本語.jp'
```


## codec.json module

please refer to lua-cjson module documentation - http://www.kyne.com.au/~mark/software/lua-cjson.php - for more details.

### Encode

- `str, err = json.encode( src:string )`

```lua
local json = require('codec').json;
local src = {
    a = 'b',
    c = {
        d = { 'e', 'f' },
        g = {
            h = 'i',
            j = { 
                'k', 
                {
                    l = 'm'
                }
            }
        }
    }
};
local enc, err = json.encode( src );
print( enc ); -- '{"a":"b","c":{"d":["e","f"],"g":{"j":["k",{"l":"m"}],"h":"i"}}}'
```

### Decode

- `str, err = json.decode( src:string )`

```lua
local inspect = require('util').inspect; -- https://github.com/mah0x211/lua-util
local json = require('codec').json;
local src = '{"a":"b","c":{"d":["e","f"],"g":{"j":["k",{"l":"m"}],"h":"i"}}}';
local dec, err = json.decode( src );
print( inspect( dec ) );
--[[
{ 
    a = "b",
    c = { 
        d = { 
            [1] = "e",
            [2] = "f"
        },
        g = { 
            j = { 
                [1] = "k",
                [2] = { 
                    l = "m"
                }
            },
            h = "i"
        }
    }
}
]]
```


## codec.geo module

please refer to geo module documentation - https://github.com/mah0x211/lua-geo - for more details.

### Encode

- `hash, err = geo.encode( lat:number, lon:number, precision:uint )`

```lua
local inspect = require('util').inspect;
local geo = require('codec').geo;
local precision = 16;
local lat = 35.673343;
local lon = 139.710388;
local hash = geo.encode( lat, lon, precision );

print( hash ); -- 'xn76gnjurcpggseg'
```


### Decode

- `tbl, err = geo.decode( geohash:string )`

```lua
local inspect = require('util').inspect;
local geo = require('codec').geo;
local hash = 'xn76gnjurcpggseg';
local latlon, err = geo.decode( hash );

print( inspect( latlon ) );
--[[
{
    lat = 35.673342999935,
    lon = 139.71038800008
}
--]]
```

