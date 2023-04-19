// npm packages
const dotenv = require("dotenv");
const express = require("express");

// app imports
const { connectToDatabase, globalResponseHeaders, APP_NAME, PORT } = require("./config");
const { errorHandler,  adminBro} = require("./handlers");
const { } = require("./routers");
const {logger} = require("./helpers");

// global constants
dotenv.config();
const app = express();
const { bodyParserHandler, globalErrorHandler, fourOhFourHandler, fourOhFiveHandler, } = errorHandler;

// database
connectToDatabase();

logger.info("Started app");

// response headers setup; CORS
// app.use(globalResponseHeaders);

// routes
app.use(adminBro.adminBro.options.rootPath, adminBro.router);
app.use('/', (req, res)=> res.redirect(adminBro.adminBro.options.rootPath));

// body parser setup
app.use(express.urlencoded({ extended: true }));
app.use(express.json({ type: "*/*" }));
app.use(bodyParserHandler); // error handling specific to body parser only

// catch-all for 404 "Not Found" errors
// app.get("*", fourOhFourHandler);
// // catch-all for 405 "Method Not Allowed" errors
// app.all("*", fourOhFiveHandler);

// app.use(globalErrorHandler);

app.listen(PORT, () => {
  console.log(`${APP_NAME} is listening on port ${PORT}...`);
});

module.exports = app;