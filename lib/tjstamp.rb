require 'RMagick'

class TJStamp
  attr_accessor :name, :size, :corner_size, :stroke_width, :font, :color, :background_color

  def initialize name: '王小明', size: 256, corner_size: 10, stroke_width: 20, font: File.join(__dir__, 'simsun.ttf'), color: 'red', background_color: 'none'
    self.name = name
    self.size = size
    self.corner_size = corner_size
    self.stroke_width = stroke_width
    self.font = font
    self.color = color
    self.background_color = background_color
  end

  def update **params
    params.each{ |key, value| send("#{key}=", value)}
  end

  def stamp
    raise 'Length of name must be in (1..4)' unless (1..4) === name.length
    canvas = Magick::Image.new(size, size){ self.background_color = 'none' }

    # square
    square = Magick::Draw.new
    square.stroke(color)
    square.fill(background_color)
    square.stroke_width(stroke_width)
    corner_width = corner_height = corner_size
    upper_x, left_y = stroke_width / 2, stroke_width / 2
    lower_x, right_y = size - stroke_width / 2, size - stroke_width / 2
    square.roundrectangle(upper_x, left_y, lower_x, right_y, corner_width, corner_height)
    # square.polyline(180,70, 173,78, 190,78, 191,62)
    
    square.draw(canvas)

    # text
    text = Magick::Draw.new
    text.font = font
    text.gravity = Magick::CenterGravity
    text.pointsize = size
    chars = name.chars
    
    case name.length
    when 1
      put_char char: chars[0], gravity: Magick::CenterGravity, draw: text, img: canvas
    when 2
      put_char char: chars[0], gravity: Magick::EastGravity, draw: text, img: canvas
      put_char char: chars[1], gravity: Magick::WestGravity, draw: text, img: canvas
    when 3
      put_char char: chars[0], gravity: Magick::EastGravity, draw: text, img: canvas
      put_char char: chars[1], gravity: Magick::NorthWestGravity, draw: text, img: canvas
      put_char char: chars[2], gravity: Magick::SouthWestGravity, draw: text, img: canvas
    when 4
      put_char char: chars[0], gravity: Magick::NorthEastGravity, draw: text, img: canvas
      put_char char: chars[1], gravity: Magick::SouthEastGravity, draw: text, img: canvas
      put_char char: chars[2], gravity: Magick::NorthWestGravity, draw: text, img: canvas
      put_char char: chars[3], gravity: Magick::SouthWestGravity, draw: text, img: canvas
    end
    
    canvas
  end

  private

  def put_char char: nil, img: nil, draw: nil, gravity: nil, color: color
    char_image = Magick::Image.new(size, size){ self.background_color = 'none' }
    char_unit_size = size/2 - stroke_width
    draw.annotate(char_image, 0, 0, 0, 0, char) { self.fill = color }

    w, h, x, y = case gravity
    when Magick::NorthWestGravity, Magick::NorthEastGravity, Magick::SouthWestGravity, Magick::SouthEastGravity
      [char_unit_size, char_unit_size, stroke_width, stroke_width]
    when Magick::WestGravity, Magick::EastGravity
      [char_unit_size, size - stroke_width, stroke_width, 0]
    when Magick::SouthGravity, Magick::NorthGravity
      [size - stroke_width, char_unit_size, 0, stroke_width]
    when Magick::CenterGravity
      [size - stroke_width, size - stroke_width, 0, 0]
    else
      raise 'Missing gravity'
    end

    img.composite!(char_image.resize(w, h), gravity, x, y, Magick::OverCompositeOp)
  end
end