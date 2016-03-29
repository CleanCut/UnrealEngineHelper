Console Commands
================

General Tips
------------

- Run things a few times to see if problems go away.  PC's tend to have random hitches due to other stuff going on outside the program.

- All the stat tools add overhead and will affect the stats themselves.

Stat Commands - General
-----------------------

- `stat (start typing)` - will autocomplete commands

- `stat none` - Clear all the stat stuff you've put on the screen so far.

- `stat unit` - Basic rate counters for frame, game, draw, and GPU.  Helps you
  quickly identify major problems.  GPU time is an estimate, but pretty close.

- `Window > Developer Tools > Output Log` - good log stuff


Stat Commands - Render Thread
-----------------------------

- `stat scenerendering` - useful when bound by draw or GPU.

- `stat rhi` - helpful to identify when something is terribly wrong.

- `show static meshes`, `show skeletalmesh` - toggle parts of rendering to see the rhi counts change

- `profilegpu` - shows calls to gpu.  `showmaterial` adds materials to the list.

- Switch between view modes (lit, unlit, wireframe, shader complexity, etc.) to help identify where the problems are

- `stat.hitches` - uses `t.hitch*` variables


Stat Commands - Game Thread
---------------------------

- `stat game` - high level overview of the game thread


Misc Stuff I don't really understand yet
----------------------------------------

- `startfpschart`/`stopfpschart` -> Saved > Profiling > FPSChartStats > (time stamp) > log files.  Can be used on consoles too (and then copied off?)
