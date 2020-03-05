/*
/ ------------------------------------
/ Complejos Controller
/ ------------------------------------
/ CRUD de Complejo
*/
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Complejo = require('../middlewares/models/').Complejos;

require('dotenv').config();
var secret = process.env.SECRET;

class ComplejoController{

    // Create complejo
    static async createComplejo(req, res){
        try{
            const {nombre,localizacion,jefe,superficie,id_sede} = req.body;
            await Complejo.findAll({
                where: {nombre: nombre,id_sede:id_sede}
            })
                .then(result=>{
                    if(result.length > 0){
                        res.status(203).json({message: "Complejo ya se encuentra registrado."});
                    }else{
                        let createNewComplejo = {
                            nombre: nombre,
                            localizacion: localizacion,
                            jefe: jefe,
                            superficie:superficie,
                            id_sede: id_sede
                        }
                        Complejo.create(createNewComplejo)
                            .then(data=>{
                                res.status(201).json({message: "Complejo creado exitosamente.",complejoData: data});
                            })
                            .catch(err=> res.json({error: err}));
                    }
                })
                .catch(err=>{
                    res.status(500);
                })

        }catch (e) {
            res.send(500);
        }
    }

    // Ver todos los complejos
    static async fetchComplejos(req, res){
        try{
            await Complejo.findAll({
                attributes: ['nombre','localizacion','jefe','superficie','id_sede']
            })
                .then(result=>{
                    if(result.length == 0){
                        res.status(203).json({message: "Sin Complejos"});
                    }else{
                        res.status(201).json({message: true, complejos: result});
                    }
                })
        }catch (e) {
            res.send(500);
        }
    }

    // Update complejo
    static async updateComplejo(req, res){
        try{
            const {nombre, localizacion,jefe,superficie,id_sede} = req.body;

            let updateComplejo = {
                nombre: nombre,
                localizacion: localizacion,
                jefe: jefe,
                superficie:superficie,
                id_sede: id_sede
            }
            await Complejo.update(updateComplejo,{
                where: {
                    id: req.params.id
                }
            })
                .then(response=>{
                    res.status(200).json({success:true, message: "Complejo actualizado exitosamente."})
                })
                .then(err=>res.json({error: err}));

        }catch (e) {
            res.sendStatus(500);
        }
    }

    // Delete complejo
    static async deleteComplejo(req, res){
        try{
            let id = req.params.id;

            await Complejo.findAll({
                where: {id: id}
            })
                .then(result=>{
                    if(result.length == 1){
                        Complejo.destroy({
                            where:{id: id}
                        })
                            .then(deleted => {
                                res.status(200).json({success: true, message: "Complejo eliminado exitosamente"});
                            });
                    }else{
                        res.status(404).json("La operación no puede ser efectuada");
                    }
                });
        }catch (e) {
            res.sendStatus(500);
        }
    }

  
}
module.exports = ComplejoController;