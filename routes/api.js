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
const SedesController = require('../controllers/SedesController');
const ComplejoController = require('../controllers/ComplejosController');

require('dotenv').config();

/**
 |-------------------------
 | Usuario Api Routes
 |-------------------------
 */

// por defecto
router.get('/usuario/', UsuarioController.welcome);

// login
router.post('/usuario/login', UsuarioController.login);

router.post('/usuario/create_usuario',checkJWT, upload.single('logo'),UsuarioController.createUsuarioAccount);

/**
 |-------------------------
 | Sede Api Routes
 |-------------------------
 */
// create sede
router.post('/sede/create_sede', checkJWT, upload.single('logo'), SedesController.createSede);

// all sedes
router.get('/sede/get_sedes', checkJWT, SedesController.fetchSedes);

// update sede
router.post('/sede/update_sede/:id', checkJWT, upload.single('logo'), SedesController.updateSede);

// delete sede
router.delete('/sede/delete_sede/:id', checkJWT, SedesController.deleteSede);

/**
 |-------------------------
 | Complejo Api Routes
 |-------------------------
 */
// create complejo
router.post('/complejo/create_complejo', checkJWT, ComplejoController.createComplejo);

// all complejo
router.get('/complejo/get_complejos', checkJWT, ComplejoController.fetchComplejos);

// update complejo
router.post('/complejo/update_complejo/:id', checkJWT, upload.single('logo'), ComplejoController.updateComplejo);

// delete sede
router.delete('/complejo/delete_complejo/:id', checkJWT, ComplejoController.deleteComplejo);

module.exports = router;