# memgraph/schema v1

## Clarifications

* `nodes[N].labels` defines all nodes associated with a unique set of labels in the graph, examples:
  * `:Person` -> `["Person"]`
  * `:Person:Student` -> `["Person", "Student"]`
* `edges` in the schema are defined by `edge_type`, `start_node_id` and `end_node_id`, where the `_id` refers to the schema node uniquely defined by the unique set of labels.
* `count` represents the number of such entities in the graph.
* `examples` defines the "address" (in the current Memgraph implementation that woudl be gid, the "global id") of the concrete nodes or edges in the graph having the specified characteristics.
* `node_indexes[.type]` is optional, if the `type` field is not present, the index type is `label` of `label+property` depending on what's present. The same applies to the `edge_indexes` it's, but instead of `label` there is `edge_type`.
* Under constraints, if `type` is `data_type` then `data_type` field is required in the STRING format (under spec.json refered as `<DATA_TYPE`):
  1. `BOOLEAN`, `STRING`, `INTEGER`, `FLOAT`, `DATE`, `LOCALTIME`, `LOCALDATETIME`, `ZONEDDATETIME`, `DURATION`, `POINT`
  2. `LIST`, `MAP`, `ENUM`, `LIST<TYPE_FROM_1>`
  3. Any closed dynamic union of the types from 1. and/or 2., e.g. `BOOLEAN | STRING`

## Implementations - github.com/memgraph/memgraph

* The full list of supported types of data type constraints please go under https://github.com/memgraph/memgraph under `src/query/frontend/opencypher/grammar/MemgraphCypher.g4` under `typeConstraintType`.
