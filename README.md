# TJStamp

![knew](http://i.imgur.com/J8OVxep.png)
![wang](http://i.imgur.com/fh5yFaA.png)

## Example

    require 'tjstamp'
    tjs = TJStamp.new(name: '朕知道了', background_color: 'white')
    image = tjs.stamp
    image.write '/tmp/knew.png'

    tjs.update name: '王小明'
    tjs.stamp.write '/tmp/wang.png'

## Options

* `name:string`

  1 to 4 length string

  default: `"王小明"`

* `size:string`

  default: `256`

* `corner_size:integer`

  default: `10`

* `stroke_width:integer`

  default: `20`

* `font:string`

  Path to font file

  default: `"simsun.ttf"`

* `color:string`

  http://studio.imagemagick.org/RMagick/doc/imusage.html#color_names

  default: `"red"`

* `background_color:string`

  default: `"none"`