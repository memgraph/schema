# memgraph/schema v1

## Clarifications

* `nodes[N].labels` defines all nodes associated with a unique set of labels in the graph, examples:
  * `:Person` -> `["Person"]`
  * `:Person:Student` -> `["Person", "Student"]`
* `edges` in the schema are defined by `edge_type`, `start_node_id` and `end_node_id`, where the `_id` refers to the schema node uniquely defined by the unique set of labels.
* `count` represents the number of such entities in the graph.
* `examples` defines the "address" (in the current Memgraph implementation that would be gid, the "global id") of the concrete nodes or edges in the graph having the specified characteristics.
