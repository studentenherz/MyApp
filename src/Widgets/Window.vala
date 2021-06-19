public class MyApp.Window : Gtk.ApplicationWindow{
	public Gtk.Stack stack {get; set;}
	public GLib.Settings settings;

	// class constructor
	public Window (Application application){
		Object(
			application: application
		);
	}

	// constructor
	construct {
		window_position = Gtk.WindowPosition.CENTER;
		set_default_size(640, 480);

		settings = new GLib.Settings("com.github.studentenherz.myapp");
		move(settings.get_int("pos-x"), settings.get_int("pos-y"));
		resize(settings.get_int("window-width"), settings.get_int("window-height"));


		// close signal
		delete_event.connect ( e => {
			int width, height, x, y;

			// WOW, interesting notation
			// nice
			get_size(out width, out height);
			get_position(out x, out y);

			// Save current state
			settings.set_int("pos-x", x);
			settings.set_int("pos-y", y);
			settings.set_int("window-width", width);
			settings.set_int("window-height", height);


			stdout.printf("Goodbye cruel world :'(");

			return false;
		});

		stack = new Gtk.Stack();

		var todo = new Gtk.Grid();
		todo.add(new Gtk.Label("ToDo Page"));
		var completed = new Gtk.Grid();
		completed.add(new Gtk.Label("Completed Page"));

		stack.add_titled(todo, "todo", "ToDo");
		stack.add_titled(completed, "completed", "Completed");

		add(stack);

		var headerbar = new MyApp.HeaderBar(this);
		set_titlebar (headerbar);

		show_all();
	}
}