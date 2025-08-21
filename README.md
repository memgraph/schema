# schema

The goal here is to define a schema standard that would be returned for a given graph by running a query like `SHOW SCHEMA INFO;`. The first few versions of the standard aim to focus on getting the statistical data about the schemaless label-property graphs. Over the long run, the goal is to incorporate the full definition of any schema the user defines.

NOTE: `.json` examples are formatted using https://jsonformatter.curiousconcept.com/ (2 Space Tab).

## use cases

The standard should be the basis for building many different applications leveraging the specification. Examples of such applications are:
* What's the right data model in the first place (how should people model, and what's the right approach), helping in communication
* graph schema visualizers
* graph query language code completion
* tools to assist with schema changes by estimating the implications
* Graph coloring based on the schema
* LLM and, in general, AI applications:
  * providing LLMs the right context to generate relevant knowledge retrieval queries
  * implementing a generator of a diverse set of queries to, e.g., fine-tune an LLM.

## usage

* [memgraph](https://github.com/memgraph/memgraph) outputs [v1](#v1) under `SHOW SCHEMA INFO;` query
* [memgraph lab](https://memgraph.com/docs/memgraph-lab) uses [v1](#v1) under graph schema and auto completion features
* [ai-toolkit](https://github.com/memgraph/ai-toolkit) uses [v1](#v1) under the [automatic SQL to graph agent](https://github.com/memgraph/ai-toolkit/tree/main/integrations/agents).

## versions

### v1
* [example graph](v1/examples/create_example.cypher)
* [example json schema](v1/examples/schema_example.json)
* [example yaml schema](v1/examples/schema_example.yaml)
