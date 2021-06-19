public class Application : Gtk.Application {
  // constructor
  public Application () {
    // call Gtk.Object constructor (Application inherites Object)
    Object(
      application_id : "com.github.studentenherz.myapp",
      flags: ApplicationFlags.FLAGS_NONE
    );
  }

  // override activate from Gtk.Application
  protected override void activate(){
    var window = new MyApp.Window(this);

    add_window (window);
  }
}