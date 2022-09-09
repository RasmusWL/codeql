---
category: breaking
---
* The `ParameterNode` class no longer extends `LocalSourceNode`, since we have introduced synthetic parameter nodes that cannot be local source nodes. All old uses of `ParameterNode` can still be used as `LocalSourceNode`, they just need to be casted.
