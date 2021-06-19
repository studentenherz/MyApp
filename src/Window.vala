public class MyApp.Window : Gtk.ApplicationWindow{
  // class constructor
  public Window (Application application){
    Object(
      application: application
    );
  }

  // constructor
  construct {
    title = "Application";
    window_position = Gtk.WindowPosition.CENTER;
    set_default_size(640, 480);
    show_all();
  }

}