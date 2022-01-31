require 'gtk3'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--mail_count MAILCOUNT') { |o| options[:mail_count] = o }
end.parse!

header = Gtk::HeaderBar.new
header.show_close_button = true
header.title = "New Mail"
header.has_subtitle = false
window = Gtk::Window.new("First example")
window.set_size_request(350, 250)
window.set_border_width(0)
window.set_position(Gtk::WindowPosition::CENTER_ALWAYS)
window.titlebar = header
window.resizable = false

# Draw background color widget
drawing_area = Gtk::DrawingArea.new
provider = Gtk::CssProvider.new
drawing_area.set_size_request(350,250)
drawing_area.signal_connect("draw") do |widget, cr|
  cyan = Cairo::Color.parse("white")
  w = widget.allocated_width
  h = widget.allocated_height
  cr.set_source_rgb(cyan.red, cyan.green, cyan.blue)
  cr.fill
end
fixed = Gtk::Fixed.new
fixed.put(drawing_area, 0, 0)
window.add(fixed)

# Add button
text = "You have %d new mail!" % options[:mail_count]
button = Gtk::Button.new(:label => text)
fixed << button

window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.show_all
Gtk.main
