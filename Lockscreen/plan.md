# Lockscreen Plan
This folder splits the lockscreen into two layers:

  - Lockscreen/LockSurface.qml — pure UI, takes screen and an auth-context object as properties. Knows nothingabout WlSessionLock.
  - Lockscreen/LockContext.qml — the auth/PAM state machine, shared across screens (so typing on one monitor shows on all).
  - Prod entry point: WlSessionLock: { surface: LockSurface {} }.

  Then a preview shell that renders the exact same LockSurface in a PanelWindow with layer: WindowLayer.Overlay — visually identical, covers everything, but it's just a layer-shell window, so there's no lock cycle at all. Which will be ran as a second instance.

  When emulating the real protocol, we can spawn another Hyprland instance to do the actual testing. 
