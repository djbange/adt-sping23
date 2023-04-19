-- Description: This file contains the SQL code to create the database and tables for the food data
-- Database: food
-- SQL: PostgreSQL
-- Author: Dipak Bange

-- Create drop table statement for each table
-- DROP TABLE public.food_category;
-- DROP TABLE public.vitamin;
-- DROP TABLE public.mineral;
-- DROP TABLE public.fat;
-- DROP TABLE public.household_weight;

-- drop all sequence
-- DROP SEQUENCE public.food_id_seq;
-- DROP SEQUENCE public.food_category_id_seq;
-- DROP SEQUENCE public.vitamin_id_seq;
-- DROP SEQUENCE public.mineral_id_seq;
-- DROP SEQUENCE public.fat_id_seq;
-- DROP SEQUENCE public.household_weight_id_seq;



-- Create staging table where RAW data will be loaded from CSV file
CREATE TABLE public.food (
	"Category" text NULL,
	"Description" text NULL,
	"Nutrient Data Bank Number" int8 NULL,
	"Data.Alpha Carotene" int8 NULL,
	"Data.Ash" float8 NULL,
	"Data.Beta Carotene" int8 NULL,
	"Data.Beta Cryptoxanthin" int8 NULL,
	"Data.Carbohydrate" float8 NULL,
	"Data.Cholesterol" int8 NULL,
	"Data.Choline" int8 NULL,
	"Data.Fiber" float8 NULL,
	"Data.Kilocalories" int8 NULL,
	"Data.Lutein and Zeaxanthin" int8 NULL,
	"Data.Lycopene" int8 NULL,
	"Data.Manganese" float8 NULL,
	"Data.Niacin" float8 NULL,
	"Data.Pantothenic Acid" float8 NULL,
	"Data.Protein" float8 NULL,
	"Data.Refuse Percentage" int8 NULL,
	"Data.Retinol" int8 NULL,
	"Data.Riboflavin" float8 NULL,
	"Data.Selenium" float8 NULL,
	"Data.Sugar Total" float8 NULL,
	"Data.Thiamin" float8 NULL,
	"Data.Water" float8 NULL,
	"Data.Fat.Monosaturated Fat" float8 NULL,
	"Data.Fat.Polysaturated Fat" float8 NULL,
	"Data.Fat.Saturated Fat" float8 NULL,
	"Data.Fat.Total Lipid" float8 NULL,
	"Data.Household Weights.1st Household Weight" float8 NULL,
	"Data.Household Weights.1st Household Weight Description" text NULL,
	"Data.Household Weights.2nd Household Weight" int8 NULL,
	"Data.Household Weights.2nd Household Weight Description" text NULL,
	"Data.Major Minerals.Calcium" int8 NULL,
	"Data.Major Minerals.Copper" float8 NULL,
	"Data.Major Minerals.Iron" float8 NULL,
	"Data.Major Minerals.Magnesium" int8 NULL,
	"Data.Major Minerals.Phosphorus" int8 NULL,
	"Data.Major Minerals.Potassium" int8 NULL,
	"Data.Major Minerals.Sodium" int8 NULL,
	"Data.Major Minerals.Zinc" float8 NULL,
	"Data.Vitamins.Vitamin A - IU" int8 NULL,
	"Data.Vitamins.Vitamin A - RAE" int8 NULL,
	"Data.Vitamins.Vitamin B12" float8 NULL,
	"Data.Vitamins.Vitamin B6" float8 NULL,
	"Data.Vitamins.Vitamin C" float8 NULL,
	"Data.Vitamins.Vitamin E" float8 NULL,
	"Data.Vitamins.Vitamin K" float8 NULL
);

-- load data from CSV file into staging table in Postgres using IDE
-- Create a sequence for id column
CREATE SEQUENCE public.food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create food category table from the staging table
CREATE TABLE public.food_category (
    "id" int8  PRIMARY KEY DEFAULT nextval('food_id_seq'),
    "category" text NULL,
    "description" text NULL,
    "nutrient_data_bank_number" int8 unique NOT NULL
);

-- insert data from staging table into food category table
INSERT INTO public.food_category (category, description, nutrient_data_bank_number)
SELECT "Category", "Description", "Nutrient Data Bank Number"
FROM public.food;

-- create pk sequence for vitamin table
CREATE SEQUENCE public.vitamin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
-- Create vitamin table from the staging table and add FK to food_category table
CREATE TABLE public.vitamin (
    "id" int8 PRIMARY KEY DEFAULT nextval('vitamin_id_seq'),
    "nutrient_data_bank_number" int8 NULL,
    "Vitamin_A_IU" int8 NULL,
    "Vitamin_A_RAE" int8 NULL,
    "Vitamin_B12" float8 NULL,
    "Vitamin_B6" float8 NULL,
    "Vitamin_C" float8 NULL,
    "Vitamin_E" float8 NULL,
    "Vitamin_K" float8 NULL,
    CONSTRAINT "fk_nutrient_data_bank_number" FOREIGN KEY ("nutrient_data_bank_number") REFERENCES public.food_category ("nutrient_data_bank_number")
);

-- insert data from staging table into vitamin table
INSERT INTO public.vitamin ("nutrient_data_bank_number", "Vitamin_A_IU", "Vitamin_A_RAE", "Vitamin_B12", "Vitamin_B6", "Vitamin_C", "Vitamin_E", "Vitamin_K")
SELECT "Nutrient Data Bank Number", "Data.Vitamins.Vitamin A - IU", "Data.Vitamins.Vitamin A - RAE", "Data.Vitamins.Vitamin B12", "Data.Vitamins.Vitamin B6", "Data.Vitamins.Vitamin C", "Data.Vitamins.Vitamin E", "Data.Vitamins.Vitamin K"
FROM public.food;


-- create pk sequence for mineral table
CREATE SEQUENCE public.mineral_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create mineral table from the staging table and add FK to food_category table
CREATE TABLE public.mineral (
    "id" int8 PRIMARY KEY DEFAULT nextval('mineral_id_seq'),
    "nutrient_data_bank_number" int8 NULL,
    "Calcium" int8 NULL,
    "Copper" float8 NULL,
    "Iron" float8 NULL,
    "Magnesium" int8 NULL,
    "Phosphorus" int8 NULL,
    "Potassium" int8 NULL,
    "Sodium" int8 NULL,
    "Zinc" float8 NULL,
    CONSTRAINT "fk_nutrient_data_bank_number" FOREIGN KEY ("nutrient_data_bank_number") REFERENCES public.food_category ("nutrient_data_bank_number")
);

-- insert data from staging table into mineral table
INSERT INTO public.mineral ("nutrient_data_bank_number", "Calcium", "Copper", "Iron", "Magnesium", "Phosphorus", "Potassium", "Sodium", "Zinc")
SELECT "Nutrient Data Bank Number", "Data.Major Minerals.Calcium", "Data.Major Minerals.Copper", "Data.Major Minerals.Iron", "Data.Major Minerals.Magnesium", "Data.Major Minerals.Phosphorus", "Data.Major Minerals.Potassium", "Data.Major Minerals.Sodium", "Data.Major Minerals.Zinc"
FROM public.food;

-- create pk sequence for household_weight table
CREATE SEQUENCE public.fat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create fat table from the staging table and add FK to food_category table
CREATE TABLE public.fat (
    "id" int8 PRIMARY KEY DEFAULT nextval('fat_id_seq'),
    "nutrient_data_bank_number" int8 NULL,
    "Monosaturated_Fat" float8 NULL,
    "Polysaturated_Fat" float8 NULL,
    "Saturated_Fat" float8 NULL,
    "Total_Lipid" float8 NULL,
    CONSTRAINT "fk_nutrient_data_bank_number" FOREIGN KEY ("nutrient_data_bank_number") REFERENCES public.food_category ("nutrient_data_bank_number")
);

-- insert data from staging table into fat table
INSERT INTO public.fat ("nutrient_data_bank_number", "Monosaturated_Fat", "Polysaturated_Fat", "Saturated_Fat", "Total_Lipid")
SELECT "Nutrient Data Bank Number", "Data.Fat.Monosaturated Fat", "Data.Fat.Polysaturated Fat", "Data.Fat.Saturated Fat", "Data.Fat.Total Lipid"
FROM public.food;

-- create pk sequence for household_weight table
CREATE SEQUENCE public.household_weight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

-- Create household_weight table from the staging table and add FK to food_category table
CREATE TABLE public.household_weight (
    "id" int8 PRIMARY KEY DEFAULT nextval('household_weight_id_seq'),
    "nutrient_data_bank_number" int8 NULL,
    "1st_Household_Weight" float8 NULL,
    "1st_Household_Weight_Description" text NULL,
    "2nd_Household_Weight" int8 NULL,
    "2nd_Household_Weight_Description" text NULL,
    CONSTRAINT "fk_nutrient_data_bank_number" FOREIGN KEY ("nutrient_data_bank_number") REFERENCES public.food_category ("nutrient_data_bank_number")
);

-- insert data from staging table into household_weight table
INSERT INTO public.household_weight ("nutrient_data_bank_number", "1st_Household_Weight", "1st_Household_Weight_Description", "2nd_Household_Weight", "2nd_Household_Weight_Description")
SELECT "Nutrient Data Bank Number", "Data.Household Weights.1st Household Weight", "Data.Household Weights.1st Household Weight Description", "Data.Household Weights.2nd Household Weight", "Data.Household Weights.2nd Household Weight Description"
FROM public.food;
