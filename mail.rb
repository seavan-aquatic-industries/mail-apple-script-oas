require "gtk3"

header = Gtk::HeaderBar.new
header.show_close_button = true
#header.show_maximize_button = false
#header.show_minimize_button = false
header.title = "New Mail"
header.has_subtitle = false

window = Gtk::Window.new("First example")
window.set_size_request(350, 250)
window.set_border_width(10)
window.set_position(Gtk::WindowPosition::CENTER_ALWAYS)
window.titlebar = header
window.resizable = false

window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
window.show_all

Gtk.main
