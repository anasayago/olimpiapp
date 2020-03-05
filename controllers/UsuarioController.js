/**
 /------------------------------------
 / Usuario Controller
 /-------------------------------------
 / operaciones de login
 / y creacion de usuario
 */

const callbacks = require('../config/callback.js');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const Usuario = require('../middlewares/models/').Usuario;

require('dotenv').config();
var secret = process.env.SECRET;

class UsuarioController{

    // Usuario welcome message
    static welcome(req, res){
        res.json({message: "Hola Usuario."});
    }

    // Usuario login operation
    static login(req, res){
        try{
            let { email,password } = req.body;
            Usuario.findAll({
                where:{email: email}
            })
            .then(usuario=>{
                if(usuario.length == 0){
                    res.status(400).json({message: "Error, no existe usuario."});
                }
            else{
                var passwordIsValid = bcrypt.compareSync(req.body.password, usuario[0].dataValues.password.trim());
                if (passwordIsValid){
                    var devDetails = {
                        id: usuario[0].dataValues.id,
                        nombre: usuario[0].dataValues.nombre,
                        email: usuario[0].dataValues.email
                    }
                    var token = jwt.sign({
                        usuario: devDetails
                    }, secret, {
                        expiresIn: '1d'
                    });

                    res.status(200).json({
                        success: true,
                        usuario: devDetails,
                        message: "Ingreso. Token generated exitosamente.",
                        token: token
                    });
                }
                else
                res.status(401).json({
                                success: false,
                                message: 'Fallo autenticacion.'
                            });

            }
            })
            .catch(e=>{
            res.status(500);
        })
           
        }catch (e) {
            res.send(500);
        }
    }

    
    static createUsuarioAccount(req, res){
    try {
        const {nombre, email, password} = req.body;
        Usuario.findAll({
            where: {email: email}
        }).then(result => {
            if (result.length > 0) {
                res.status(203).json({message: "Email ya existe ."});
            } else {
                let createNewUsuario = {
                    nombre: nombre,
                    email: email,
                    password: bcrypt.hashSync(password, 10)
                }
                Usuario.create(createNewUsuario)
                                    .then(data => {
                                        if(data){
                                            res.status(201).json({message: "Usuario creado", Usuario: data})
                                        }
                                    })
                                    .catch(err => res.json({error: err}));
            }
        })
    .catch(err => {
        res.sendStatus(500);
    })
  }
  catch (e) {
      res.sendStatus(500);
   }
  }
}

module.exports = UsuarioController;