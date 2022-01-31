require 'gtk3'

def roundrect(context, x, y, width, height, radius)
  context.arc(x + radius, y + radius, radius,
              Math::PI, 3 * Math::PI / 2)
  context.arc(x + width - radius, y + radius, radius,
              3 * Math::PI / 2, 0)
  context.arc(x + width - radius, y + height - radius,
              radius, 0, Math::PI / 2)
  context.arc(x + radius, y + height - radius, radius,
              Math::PI / 2, Math::PI)
  context.close_path()
end

class Button < Gtk::DrawingArea
  def initialize(text)
    super()
    add_events(Gdk::EventMask::BUTTON_PRESS_MASK)
    add_events(Gdk::EventMask::BUTTON_RELEASE_MASK)
    add_events(Gdk::EventMask::POINTER_MOTION_MASK)
    signal_connect "draw" do |widget, context|
      do_drawing(widget, context)
    end
    @width = 0
    @height = 0
    @text = text
  end

  def set_size(width, height)
    self.set_size_request(width, height)
    @width = width
    @height = height
  end

  def do_drawing(widget, context)
    context.set_source_rgb(0.58, 0.72, 0.10)
    roundrect(context, 0, 0, @width, @height, 5)
    context.fill
    context.move_to(18, 18)
    context.set_source_rgb(1.0, 1.0, 1.0)
    context.set_font_size(14)
    context.show_text(@text.upcase)
  end
end
