import { createBinding } from "ags";
import { Astal, Gtk, Gdk } from "ags/gtk4";
import Hyprland from "gi://AstalHyprland";

const NUM_WORKSPACES = [10, 2];

export default function Bar() {
  return (
    <box $type={"center"} spacing={10} >
      {NUM_WORKSPACES.map((curr, i, arr) => 
        <BubbleGroup
          prev={i === 0 ? 0 : arr[i-1]}
          numWorkspaces={curr}
          groupId={i+1}
        />
      )}
    </box>
  )
}

function BubbleGroup({prev, numWorkspaces, groupId}: {prev: number, numWorkspaces: number, groupId: number}) {
  return (
    <box $type={"center"} cssClasses={["workspaces"]} spacing={10} >
      {Array.from({ length: numWorkspaces }, (_, j) => (
        <WorkspaceBubble workspaceId={prev + j+1} groupId={groupId} />
      ))}
    </box>
  )
}

interface WorkspaceBubbleArgs {
  workspaceId: number;
  groupId: number;
}

function WorkspaceBubble({ workspaceId, groupId }: WorkspaceBubbleArgs) {
  const hyprland = Hyprland.get_default();
  const activeWorkspaceId = createBinding(hyprland, "focusedWorkspace").as(ws => ws?.id);

  const bubbleCssClasses = activeWorkspaceId.as(activeId => {
    const classes = ["bubble", `wg-${groupId}`];
    if (activeId === workspaceId) {
      classes.push("active");
    }
    return classes;
  });

  return (
    <box cssClasses={bubbleCssClasses} widthRequest={5} heightRequest={5}></box>
  )
}
