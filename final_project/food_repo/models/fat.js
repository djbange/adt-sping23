// Create Fat table model of existing fat table
/*

CREATE TABLE public.fat (
	id bigserial NOT NULL,
	nutrient_data_bank_number int8 NULL,
	"Monosaturated_Fat" float8 NULL,
	"Polysaturated_Fat" float8 NULL,
	"Saturated_Fat" float8 NULL,
	"Total_Lipid" float8 NULL,
	CONSTRAINT fat_pkey PRIMARY KEY (id)
);
-- public.fat foreign keys

ALTER TABLE public.fat ADD CONSTRAINT fk_nutrient_data_bank_number FOREIGN KEY (nutrient_data_bank_number) REFERENCES public.food_category(nutrient_data_bank_number);

*/
const logger = require('../helpers').logger;

const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const Fat = dbConn.define('Fat', {
    id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true
    },
    nutrient_data_bank_number: {
        type: DataTypes.INTEGER,
        allowNull: true,
        // references: {
        //     model: 'food_category',
        //     key: 'nutrient_data_bank_number'
        // }
    },
    Monosaturated_Fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Polysaturated_Fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Saturated_Fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    Total_Lipid: {
        type: DataTypes.FLOAT,
        allowNull: true
    }
}, {
    tableName: 'fat',
    timestamps: false
});

module.exports = Fat;

