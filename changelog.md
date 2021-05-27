# Changelog

## v0.2.0 (2021-05-27)

  * Migrate to Surface 0.4.1 (atoms not auto-cast anymore), has to be 0.4.1 or above because 0.4.0 swamps with compiler warnings due to a change in LiveView
  * [BREAKING CHANGE] Completely rework NavBar, look at examples to see how to use NavBar. It has been moved to only implement the outer and main components as I was unable to find a proper middleway for all the permutations. This is a BREAKING CHANGE because the old NavBar was naively done and could not support sidebars, and it also did not implement the collapser properly.
  * Added a naive tooltip implementation, injects a <span> with random ID, so it might provoke rerenders. 
  * Exposed a hook you can simply use with `:hook={{ "Hook", from: SurfaceBootstrap.Tooltip }}`. This requires you to put a unique HTML ID on your component, as this is a requirements for hooks to fire. 

## v0.1.0 (2021-05-01)

  * I didn't bother with changelogs before 0.2.0, sorry!
