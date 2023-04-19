/*
CREATE TABLE public.mineral (
	id bigserial NOT NULL,
	nutrient_data_bank_number int8 NULL,
	"Calcium" int8 NULL,
	"Copper" float8 NULL,
	"Iron" float8 NULL,
	"Magnesium" int8 NULL,
	"Phosphorus" int8 NULL,
	"Potassium" int8 NULL,
	"Sodium" int8 NULL,
	"Zinc" float8 NULL,
	CONSTRAINT mineral_pkey PRIMARY KEY (id)
);
*/

const logger = require('../helpers').logger;
const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const Mineral = dbConn.define('Mineral', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    nutrient_data_bank_number: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Calcium": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Copper": {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    "Iron": {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    "Magnesium": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Phosphorus": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Potassium": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Sodium": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "Zinc": {
        type: DataTypes.FLOAT,
        allowNull: true
    }
}, {
    tableName: 'mineral',
    timestamps: false
});

module.exports = Mineral;
