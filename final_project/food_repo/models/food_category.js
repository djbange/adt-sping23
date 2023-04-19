/*
CREATE TABLE public.food_category (
	id int8 NOT NULL DEFAULT nextval('food_id_seq'::regclass),
	category text NULL,
	description text NULL,
	nutrient_data_bank_number int8 NOT NULL,
	CONSTRAINT food_category_nutrient_data_bank_number_key UNIQUE (nutrient_data_bank_number),
	CONSTRAINT food_category_pkey PRIMARY KEY (id)
);
*/
const logger = require('../helpers').logger;

const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const FoodCategory = dbConn.define('FoodCategory', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    category: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    "nutrient_data_bank_number": {
        type: DataTypes.BIGINT,
        allowNull: true
    }
}, {
    tableName: 'food_category',
    timestamps: false
});

module.exports = FoodCategory;