// npm packages
const express = require("express");

// app imports
const { authHandler } = require("../handlers");

// globals
const router = new express.Router();

/* All the Things Route */
// router.post("/login", authHandler.login);

module.exports = router;