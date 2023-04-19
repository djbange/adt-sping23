/*
CREATE TABLE public.vitamin (
	id bigserial NOT NULL,
	nutrient_data_bank_number int8 NULL,
	"Vitamin_A_IU" int8 NULL,
	"Vitamin_A_RAE" int8 NULL,
	"Vitamin_B12" float8 NULL,
	"Vitamin_B6" float8 NULL,
	"Vitamin_C" float8 NULL,
	"Vitamin_E" float8 NULL,
	"Vitamin_K" float8 NULL,
	CONSTRAINT vitamin_pkey PRIMARY KEY (id)
);
*/

const logger = require('../helpers').logger;
const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const Vitamin = dbConn.define('Vitamin', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    nutrient_data_bank_number: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    Vitamin_A_IU: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    Vitamin_A_RAE: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    Vitamin_B12: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Vitamin_B6: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Vitamin_C: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Vitamin_E: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Vitamin_K: {
        type: DataTypes.FLOAT,
        allowNull: true
    }
}, {
    tableName: 'vitamin',
    timestamps: false
});

module.exports = Vitamin;