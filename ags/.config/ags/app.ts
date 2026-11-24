import app from "ags/gtk4/app"
import { Gdk, Gtk } from "ags/gtk4"
import style from "./style.scss"
import Bar from "@/widget/bar/Bar"
import { createBinding, createEffect} from "ags"

app.start({
  css: style,
  main() {
    const monitors = createBinding(app, "monitors")
    const windows = new Map<Gdk.Monitor, Gtk.Window>()

    createEffect(() => {
      const current = monitors()
      const currentSet = new Set(current)

      // Destroy windows for disconnected monitors
      for (const [mon, win] of windows) {
        if (!currentSet.has(mon)) {
          win.destroy()
          windows.delete(mon)
        }
      }

      // Create windows for newly connected monitors
      for (const mon of current) {
        if (!windows.has(mon)) {
          windows.set(mon, Bar(mon) as Gtk.Window)
        }
      }
    })
  },
})
