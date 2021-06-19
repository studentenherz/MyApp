public class MyApp.HeaderBar : Gtk.HeaderBar {
	public MyApp.Window window {get; construct;}

	public HeaderBar(MyApp.Window win){
		Object(
			window: win
		);
	}
	
	construct {
		show_close_button = true;

		var add_button = new Gtk.Button.with_label("Add"); // this _() is for alowing later translation
		add_button.get_style_context().add_class("suggested-action");
		add_button.valign = Gtk.Align.CENTER;

		add_button.clicked.connect(() => {
			var dialog = new Gtk.Dialog.with_buttons(
				"Add new Note",
				window,
				Gtk.DialogFlags.MODAL | 
				Gtk.DialogFlags.DESTROY_WITH_PARENT, 
				"OK", 1, 
				"Cancel", 2,
				null
			);

			var label = new Gtk.Label("Lorem Ipsum");
			var content_area = dialog.get_content_area();

			content_area.add(label);

			dialog.show_all();
			dialog.present();
		});


		pack_start(add_button);

		var menu_button = new Gtk.Button.from_icon_name ("open-menu", Gtk.IconSize.LARGE_TOOLBAR);
		pack_end(menu_button);
		menu_button.valign = Gtk.Align.CENTER;

		var stack_switcher = new Gtk.StackSwitcher();
		stack_switcher.stack = window.stack;

		set_custom_title(stack_switcher);
	}
}