TJStamp
=======

<table>
  <tr>
    <td><img src="http://i.imgur.com/J8OVxep.png" alt="朕知道了"></td>
    <td><img src="http://i.imgur.com/fh5yFaA.png" alt="王小明"></td>
    <td><img src="http://i.imgur.com/mvqALym.png" alt="愉悅"></td>
    <td><img src="http://i.imgur.com/t0HGJZK.png" alt="爽"></td>
  </tr>
</table>

Installation
------------

    > gem install tjstamp

Example
-------

    # Basic Usage
    require 'tjstamp'
    tjs = TJStamp.new(name: '朕知道了', background_color: 'white')
    image = tjs.stamp # => Magick::Image
    image.display

    # Write to file
    tjs.update name: '王小明', size: 512
    tjs.stamp.write '/tmp/wang.png'

Options
-------

* `name`: Default: `"王小明"`
* `size:` Default: `256`
* `corner_size`: Default: `10`
* `stroke_width`: Default: `20`
* `font`: Path to font file, Default: `"simsun.ttf"`
* `color`: [Check here](http://studio.imagemagick.org/RMagick/doc/imusage.html#color_names) for more information. Default: `"red"`
* `background_color`: Default: `"none"`