const adminJS = require('adminjs');
const sequelizeAdminBro = require('@adminjs/sequelize');
const expressAdminBro = require('@adminjs/express');
const {dbConn} = require('../config');

//Admin Bro and Models
const {fatModel,
  foodModel,
  foodCategoryModel,
  householdWeightModel,
  mineralModel,
  vitaminModel
} = require('../models')

adminJS.registerAdapter(sequelizeAdminBro);

// AuthenticatorResponse
const authenticate = async (email, password) => {
  if (email === process.env.ADMIN_EMAIL && password === process.env.ADMIN_PASSWORD) {
    return { email }
  }
  return null
}

const AdminBroOptions = {
  databases: [dbConn],
  resources: [
    {
      resource: foodModel,
      options: {}
    },
    {
      resource: fatModel,
      options: {}
    },
    {
      resource: foodCategoryModel,
      options: {}
    },
    {
      resource: householdWeightModel,
      options: {}
    },
    {
      resource: mineralModel,
      options: {}
    },
    {
      resource: vitaminModel,
      options: {}
    }
  ],
  rootPath: '/admin',
  
  branding: {
    companyName: 'Food Nutrition',
    logo: 'https://i.imgur.com/nbIBTHa.png',
    softwareBrothers: false,
  },
  dashboard: {
    component: adminJS.bundle('../dashboard/index')
  },
  loginPath: '/admin/login',
  logoutPath: '/admin/logout',


};

const adminBro = new adminJS(AdminBroOptions);
// const router = expressAdminBro.buildRouter(adminBro);
const  router = expressAdminBro.buildAuthenticatedRouter(adminBro, {
  authenticate,
  cookieName: 'admin-bro',
  cookiePassword: process.env.COOKIE_SECRET,
  },
  null,
  {
    resave: true,
    saveUninitialized: true,
    secret: process.env.SESSION_SECRET,
  }
);
  

adminBro.watch();

module.exports = {
    adminBro,
    router,
}