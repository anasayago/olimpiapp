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
const SubsedeController = require('../controllers/SubsedesController');
const DeporteController = require('../controllers/DeportesController');

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

router.post('/usuario/create_usuario',UsuarioController.createUsuarioAccount);

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

/**
 |-------------------------
 | Deporte Api Routes
 |-------------------------
 */
// create deporte
router.post('/deporte/create_deporte', checkJWT, DeporteController.createDeporte);

// all deporte
router.get('/deporte/get_deportes', checkJWT, DeporteController.fetchDeportes);

// update deporte
router.post('/deporte/update_deporte/:id', checkJWT, upload.single('logo'), DeporteController.updateDeporte);

// delete deporte
router.delete('/deporte/delete_deporte/:id', checkJWT, DeporteController.deleteDeporte);
/**
 |-------------------------
 | Subsede Api Routes
 |-------------------------
 */
// create subsede
router.post('/subsede/create_subsede', checkJWT, SubsedeController.createSubsede);

// all subsede
router.get('/subsede/get_subsedes', checkJWT, SubsedeController.fetchSubsedes);

// update subsede
router.post('/subsede/update_subsede/:id', checkJWT, upload.single('logo'), SubsedeController.updateSubsede);

// delete subsede
router.delete('/subsede/delete_subsede/:id', checkJWT, SubsedeController.deleteSubsede);
module.exports = router;