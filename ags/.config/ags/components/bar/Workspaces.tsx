import { createBinding } from "ags";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import Hyprland from "gi://AstalHyprland";

const num_workspaces = 7;

export default function Bar() {

  const hyprland = Hyprland.get_default();

  return (
    <box $type={"center"} cssClasses={["workspaces"]} spacing={10} >
      {Array.from({ length: num_workspaces }, (_, i) => (
        <WorkspaceBubble workspaceId={i} />
      ))}
    </box>
  )
}

interface WorkspaceBubbleArgs {
  workspaceId: number;
}

function WorkspaceBubble({ workspaceId }: WorkspaceBubbleArgs) {
  const hyprland = Hyprland.get_default();

  const client = createBinding(hyprland, "focusedClient")
  const bubbleCssClasses = client.as(fw => {
    const classes = ["bubble"];

    if (fw?.get_workspace().id === workspaceId) {
      classes.push("active");
    }

    return classes
  });

  return (
    <box cssClasses={bubbleCssClasses} widthRequest={5} heightRequest={5}></box>
  )
}
