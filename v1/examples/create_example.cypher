CREATE ENUM Status VALUES { Good, Okay, Bad };

CREATE
    (a:Person {name:'John', age:30}),
    (b:Person :Child {name:'Nick'}),
    (c:Person {name:'Helen', age:29, occupation:'student'}),
    (d:Person :Student {name:'Bob', interests: ['programming', 'math']}),
    (e:School {title: 'School 1', status: Status::Good, location: point({x:1, y:2, z:3, crs:'wgs-84-3d'})}),
    (f:Person {name: 'Phil', age:33, embedding:[1.0, 2.0, 3.0], occupation:'president'}),
    (a)-[:IS_FAMILY {since:2015}]->(b),
    (a)-[:IS_FAMILY {since: 2010}]->(c),
    (b)-[:IS_FAMILY {since:2015}]->(c),
    (c)-[:IS_FAMILY {since:2011}]->(d),
    (a)-[:IS_FAMILY]->(d),
    (b)-[:IS_STUDENT {start: 2020}]->(e);

CREATE INDEX ON :Student;
CREATE INDEX ON :Person(name);
CREATE POINT INDEX ON :School(location);
CREATE TEXT INDEX personTextIndex ON :Person;
CREATE VECTOR INDEX embeddingVectorIndex ON :Person(embedding) WITH CONFIG {"capacity": 10, "dimension": 3};

CREATE EDGE INDEX ON :IS_STUDENT;
CREATE EDGE INDEX ON :IS_FAMILY(since);

CREATE CONSTRAINT ON (n:Person) ASSERT EXISTS (n.name);
CREATE CONSTRAINT ON (n:School) ASSERT n.title IS UNIQUE;
CREATE CONSTRAINT ON (n:Person) ASSERT n.age IS TYPED INTEGER;
