const sequelize = require("sequelize");

//app
const {logger} = require("./helpers/logger")
require('dotenv').config();

const APP_NAME = "food_details";
const ENV = process.env.NODE_ENV;
const PORT = process.env.BE_PORT;
const POSTGRES_URI = process.env.POSTGRES_URI || "localhost";
const DB_NAME = process.env.POSTGRES_DB;
const DB_USERNAME = process.env.POSTGRES_USER;
const DB_PASSWORD = process.env.POSTGRES_PASSWORD;
const DB_PORT = process.env.POSTGRES_PORT || '5432';
const DIALECT = process.env.POSTGRES_DIALECT;
const HOST_URL = process.env.HOST_URL || "http://localhost:3000";

if (ENV === "dev" || ENV === "test") {
  // sequelize.sync({ logging: console.log });
}

const dbConn = new sequelize(
  DB_NAME,
  DB_USERNAME,
  DB_PASSWORD,
  {
    host: POSTGRES_URI,
    dialect: DIALECT,
    port: DB_PORT,
    // logging: false,
    dialectOptions: {
      ssl: {
          require: true,
          rejectUnauthorized: false
      }
   },
  }
);
/**
 * Connect to sequelize asynchronously or bail out if it fails
 */
async function connectToDatabase() {

  try {
    await dbConn.authenticate();
    logger.info(`${APP_NAME} successfully connected to database.`);
  } catch (error) {
    console.log('Error in DB connection: ', error)
    logger.error(error);
    process.exit(1);
  }
}

/**
 * Configuration middleware to enable cors and set some other allowed headers.
 *  You can also just use the 'cors' package.
 */
function globalResponseHeaders(request, response, next) {
  response.header("Access-Control-Allow-Origin", "*");
  response.header(
    "Access-Control-Allow-Headers",
    "Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Authorization"
  );
  response.header(
    "Access-Control-Allow-Methods",
    "POST,GET,PATCH,DELETE,OPTIONS"
  );
  response.header("Content-Type", "application/json");
  return next();
}

module.exports = {
  APP_NAME,
  ENV,
  PORT,
  connectToDatabase,
  globalResponseHeaders,
  dbConn,
  HOST_URL
};