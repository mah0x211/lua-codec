local idna = require('codec').idna;
local src = '日本語.jp';
local enc, dec;

enc = ifNil( idna.encode( src ) );
dec = ifNil( idna.decode( enc ) );
ifNotEqual( dec, src );
