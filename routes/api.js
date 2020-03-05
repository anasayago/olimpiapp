/**
 |----------------------------------
 | Api Route
 |----------------------------------
 */

const express = require("express");
const router = express.Router();

const con = require('../config/database.js');
const jwt = require('jsonwebtoken');
const checkJWT = require('../middlewares/check-jwt');
const upload = require('../middlewares/uploadMiddleware');

const UsuarioController = require('../controllers/UsuarioController');
//const SchoolController = require('../controllers/SchoolController');
//const FacultyController = require('../controllers/FacultyController');
//const DepartmentController = require('../controllers/DepartmentController');

require('dotenv').config();

/**
 |-------------------------
 | Usuario Api Routes
 |-------------------------
 */

// developer welcome
router.get('/usuario/', UsuarioController.welcome);

// developer login
router.post('/usuario/login', UsuarioController.login);

// create School account
//router.post('/usuario/create_school_acct', checkJWT, upload.single('logo'), DeveloperController.createSchoolAccount);

// fetch school accounts
//router.get('/developer/get_school_acct', checkJWT, DeveloperController.fetchSchools);

// update School account
//router.post('/developer/update_school_acct/:id', checkJWT, upload.single('logo'), DeveloperController.updateSchoolAccount);

// delete school account
//router.delete('/developer/delete_school_acct/:id', checkJWT, DeveloperController.deleteSchoolAccount);

// create Campus account
//router.post('/developer/create_campus_acct', checkJWT, DeveloperController.createCampusAccount);

// create Faculty account
//router.post('/developer/create_faculty_acct', checkJWT, upload.single('faculty_pix'), DeveloperController.createFacultyAccount);

// update Faculty account
//router.post('/developer/update_faculty_acct/:id',checkJWT,upload.single('faculty_pix'), DeveloperController.updateFacultyAccount);

// fetch faculty account
//router.get('/developer/get_faculty_acct/:id', checkJWT, DeveloperController.fetchFacultyAccount)

// create Department account
//router.post('/developer/create_dept_acct', checkJWT, upload.single('logo'), DeveloperController.createDeptAccount);

module.exports = router;