/*
CREATE TABLE public.household_weight (
	id bigserial NOT NULL,
	nutrient_data_bank_number int8 NULL,
	"1st_Household_Weight" float8 NULL,
	"1st_Household_Weight_Description" text NULL,
	"2nd_Household_Weight" int8 NULL,
	"2nd_Household_Weight_Description" text NULL,
	CONSTRAINT household_weight_pkey PRIMARY KEY (id)
);
*/
const logger = require('../helpers').logger;
const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const HouseholdWeight = dbConn.define('HouseholdWeight', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    nutrient_data_bank_number: {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "1st_Household_Weight": {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    "1st_Household_Weight_Description": {
        type: DataTypes.TEXT,
        allowNull: true
    },
    "2nd_Household_Weight": {
        type: DataTypes.INTEGER,
        allowNull: true
    },
    "2nd_Household_Weight_Description": {
        type: DataTypes.TEXT,
        allowNull: true
    }
}, {
    tableName: 'household_weight',
    timestamps: false
});

module.exports = HouseholdWeight;