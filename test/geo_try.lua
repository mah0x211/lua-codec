local floor = math.floor;
local ceil = math.ceil;
local geo = require('codec').geo;
local lat = 35.673343;
local lon = 139.710388;
local precision = 16;
local hash = 'xn76gnjurcpggseg';
local enc, dec;

-- encode
enc = ifNil( geo.encode( lat, lon, precision ) );
ifNotEqual( enc, hash );

-- decode
dec = ifNil( geo.decode( enc ) );
-- resolve round-off error
ifNotEqual( floor( dec.lat * 1000000 + .5 ), ceil( lat * 1000000 ) );
ifNotEqual( floor( dec.lon * 1000000 + .5 ), ceil( lon * 1000000 ) );
