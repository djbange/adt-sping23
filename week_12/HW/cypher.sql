LOAD CSV WITH HEADERS FROM "file:///D:/Dipak/ms_docx_aug_22/spring_23/ADT/adt-sping23/week_12/HW/netflix_titles.csv" AS row
CREATE (m:Movie {
    id: row.show_id,
    title: row.title,
    director : row.director,
    country : row.country,
    date_str : row.date_added, 
    release_year : row.release_year,
    rating : row.rating,
    duration : row.duration,
    listed_in : row.listed_in,
    description : row.description,
    cast: row.cast,
    year : row.year,
    month : row.month,
    day : row.day,
    type : row.type_movie
})

-- Create Nodes for Person/Actor, relationship with Movie(ACTED_IN, DIRECTED)
MATCH (m:Movie)
WHERE m.cast IS NOT NULL
WITH m
UNWIND split(m.cast, ',') AS actor
MERGE (p:Person {name: trim(actor)})
MERGE (p)-[r:ACTED_IN]->(m);

-- Create Nodes for Category, relationship with Movie(IN_CATEGORY)
MATCH (m:Movie)
WHERE m.listed_in IS NOT NULL
WITH m
UNWIND split(m.listed_in, ',') AS category
MERGE (c:Category {name: trim(category)})
MERGE (m)-[r:IN_CATEGORY]->(c);

-- Create Nodes for Type
MATCH (m:Movie)
WHERE m.type IS NOT NULL
WITH m
MERGE (t:Type {type: m.type})
MERGE (m)-[r:TYPED_AS]->(t);

-- create countries nodes
MATCH (m:Movie)
WHERE m.country IS NOT NULL
MERGE (c:Country {name: trim(m.country)})
MERGE (m)-[:WHERE]->(c);

-- Find movies with Brad Pitt and Brad Anderson
MATCH (cs:Person { name: 'Brad Anderson' }),(ms:Person { name: 'Brad Pitt' }), p = shortestPath((cs)-[:ACTED_IN|DIRECTED*]-(ms))
    WHERE length(p)> 1 
    RETURN p;

-- Find movies with Adam Sandler and Jennifer Aniston
MATCH (cs:Person { name: 'Adam Sandler' }),(ms:Person { name: 'Jennifer Aniston' }), p = shortestPath((cs)-[:ACTED_IN|DIRECTED*]-(ms))
    WHERE length(p)> 1 
    RETURN p;

-- top 5 actor with most movies
MATCH (p:Person)-[rel:ACTED_IN]->(m:Movie)
WITH p,collect(m.title) as movies,count(*) as total
RETURN  p.name, movies,total
ORDER BY total DESC
LIMIT 5;

-- top 5 director with most movies
MATCH (p:Person)-[rel:DIRECTED*]->(m:Movie)
WITH p,collect(m.title) as movies,count(*) as total
RETURN  p.name, movies,total
ORDER BY total DESC
LIMIT 5;

-- top 5 category with most movies
MATCH (c:Category)<-[rel:IN_CATEGORY]-(m:Movie)
WITH c.name as category,count(*) as total
RETURN  category,total
ORDER BY total DESC;

-- top 5 type with most movies
MATCH (t:Type)<-[rel:TYPED_AS]-(m:Movie)
WITH t.type as type,count(*) as total
RETURN  type,total
ORDER BY total DESC;

-- top 5 country with most movies
MATCH (c:Country)<-[rel:WHERE]-(m:Movie)
WITH c.name as country,count(*) as total
RETURN  country,total
ORDER BY total DESC;


CALL db.schema.visualization();