import { createBinding, createComputed } from "ags";
import Hyprland from "gi://AstalHyprland";

const NUM_WORKSPACES = [5, 5, 2];

export default function Bar() {
  let offset = 0;

  return (
    <box $type={"center"} spacing={12} >
      {NUM_WORKSPACES.map((curr, i) => {
        const groupOffset = offset;
        offset += curr

        return (
          <BubbleGroup
            offset={groupOffset}
            numWorkspaces={curr}
            groupId={i+1}
          />
        )
      })}
    </box>
  )
}

function BubbleGroup({offset, numWorkspaces, groupId}: {offset: number, numWorkspaces: number, groupId: number}) {
  return (
    <box $type={"center"} cssClasses={["workspaces"]} spacing={10} >
      {Array.from({ length: numWorkspaces }, (_, j) => (
        <WorkspaceBubble workspaceId={offset + j+1} groupId={groupId} />
      ))}
    </box>
  )
}

interface WorkspaceBubbleArgs {
  workspaceId: number;
  groupId: number;
}

const hyprland = Hyprland.get_default();

const focusedId = createBinding(hyprland, "focusedWorkspace").as(ws => ws?.id);
const clients = createBinding(hyprland, "clients");

function WorkspaceBubble({ workspaceId, groupId }: WorkspaceBubbleArgs) {
  const bubbleCssClasses = createComputed(() => {
    const classes = ["bubble", `wg-${groupId}`];

    if (focusedId() === workspaceId) classes.push("active");
    if (clients().some(c => c.workspace?.id === workspaceId)) classes.push("occupied");

    return classes;
  });

  return <box cssClasses={bubbleCssClasses} />;
}
