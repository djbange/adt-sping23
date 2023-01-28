CREATE TABLE char_data_types (
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

INSERT INTO char_data_types
  VALUES
      ('abc', 'abc', 'abc'),
      ('defghi', 'defghi', 'defghi');
      

SELECT * FROM char_data_types;

CREATE TABLE people (
    id serial,
    person_name varchar(100)
);

INSERT INTO people(person_name)
  VALUES
      ('mike'),
      ('sony');

SELECT * from people;

CREATE TABLE number_data_types (
    numeric_column numeric(20,5),
      real_column float,
      double_column double
  );


INSERT INTO number_data_types
  VALUES
      (.7, .7, .7),
      (2.13579, 2.13579, 2.13579),
      (2.1357987654, 2.1357987654, 2.1357987654);
select * from number_data_types;