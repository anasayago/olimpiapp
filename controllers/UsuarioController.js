/**
 /------------------------------------
 / Usuario Controller
 /-------------------------------------
 / Holds all basic operations
 / of the usuario
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
                    }else{
                        var passwordIsValid = bcrypt.compareSync(req.body.password, usuario[0].dataValues.password.trim());

                        if (passwordIsValid){
                            var devDetails = {
                                id: usuario[0].dataValues.id,
                                fullname: usuario[0].dataValues.fullname,
                                email: usuario[0].dataValues.email,
                                is_auth: 'usuario'
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
                        }else{
                            res.status(401).json({
                                success: false,
                                message: 'Fallo autenticacion.'
                            });
                        }
                    }
                })
                .catch(e=>{
                res.status(500);
            })

        }catch (e) {
            res.send(500);
        }
    }

}
module.exports = UsuarioController;