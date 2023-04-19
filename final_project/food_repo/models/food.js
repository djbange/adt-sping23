/*

CREATE TABLE public.food (
	category text NULL,
	description text NULL,
	"Nutrient Data Bank Number" int8 NULL,
	alpha_carotene int8 NULL,
	ash float8 NULL,
	beta_carotene int8 NULL,
	beta_cryptoxanthin int8 NULL,
	carbohydrate float8 NULL,
	cholesterol int8 NULL,
	choline int8 NULL,
	fiber float8 NULL,
	kilocalories int8 NULL,
	lutein_and_zeaxanthin int8 NULL,
	lycopene int8 NULL,
	manganese float8 NULL,
	niacin float8 NULL,
	pantothenic_acid float8 NULL,
	protein float8 NULL,
	refuse_percentage int8 NULL,
	retinol int8 NULL,
	riboflavin float8 NULL,
	selenium float8 NULL,
	sugar_total float8 NULL,
	thiamin float8 NULL,
	water float8 NULL,
	monosaturated_fat float8 NULL,
	polysaturated_fat float8 NULL,
	saturated_fat float8 NULL,
	total_lipid float8 NULL,
	first_household_weight float8 NULL,
	first_household_weight_description text NULL,
	second_household_weight int8 NULL,
	second_household_weight_description text NULL,
	calcium int8 NULL,
	copper float8 NULL,
	iron float8 NULL,
	magnesium int8 NULL,
	phosphorus int8 NULL,
	potassium int8 NULL,
	sodium int8 NULL,
	zinc float8 NULL,
	vitamin_a_iu int8 NULL,
	vitamin_a_rae int8 NULL,
	vitamin_b12 float8 NULL,
	vitamin_b6 float8 NULL,
	vitamin_c float8 NULL,
	vitamin_e float8 NULL,
	vitamin_k float8 NULL
);

*/
const logger = require('../helpers').logger;

const { Model, DataTypes } = require('sequelize');
const { dbConn } = require('../config');

const Food = dbConn.define('Food', {
    category: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    "Nutrient Data Bank Number": {
        type: DataTypes.BIGINT,
        // allowNull: true,
        primaryKey: true
    },
    alpha_carotene: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    ash: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    beta_carotene: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    beta_cryptoxanthin: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    carbohydrate: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    cholesterol: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    choline: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    fiber: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    kilocalories: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    lutein_and_zeaxanthin: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    lycopene: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    manganese: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    niacin: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    pantothenic_acid: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    protein: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    refuse_percentage: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    retinol: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    riboflavin: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    selenium: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    sugar_total: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    thiamin: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    water: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    monosaturated_fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    polysaturated_fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    saturated_fat: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    total_lipid: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    first_household_weight: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    first_household_weight_description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    second_household_weight: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    second_household_weight_description: {
        type: DataTypes.TEXT,
        allowNull: true
    },
    calcium: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    copper: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    iron: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    magnesium: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    phosphorus: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    potassium: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    sodium: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    zinc: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    vitamin_a_iu: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    vitamin_a_rae: {
        type: DataTypes.BIGINT,
        allowNull: true
    },
    vitamin_b12: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    vitamin_b6: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    vitamin_c: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    vitamin_e: {
        type: DataTypes.FLOAT,
        allowNull: true
    },
    vitamin_k: {
        type: DataTypes.FLOAT,
        allowNull: true
    }
}, {
    tableName: 'food',
    timestamps: false,
});

module.exports = Food;