local json = require('codec').json;
local tbl = {
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
local enc = ifNil( json.encode( tbl ) );
local dec = ifNil( json.decode( enc ) );

ifNotEqual( inspect( dec ), inspect( tbl ) );

-- invalid encode
ifNotNil( json.encode( { function()end } ) );
-- invalid decode
ifNotNil( json.decode( enc .. ',' ) );

