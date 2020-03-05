/*
/ ------------------------------------
/ Deportes Controller
/ ------------------------------------
/ CRUD de Deportes
*/
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Deporte = require('../middlewares/models/').Deporte;

require('dotenv').config();
var secret = process.env.SECRET;

class DeporteController{

    // Create deporte
    static async createDeporte(req, res){
        try{
            const {nombre,indicador,id_subsede} = req.body;
            await Deporte.findAll({
                where: {nombre: nombre,id_subsede:id_subsede}
            })
                .then(result=>{
                    if(result.length > 0){
                        res.status(203).json({message: "Deporte ya se encuentra registrada."});
                    }else{
                        let createNewDeporte = {
                            nombre: nombre,
                            indicador: indicador,
                            id_subsede: id_subsede
                        }
                        Deporte.create(createNewDeporte)
                            .then(data=>{
                                res.status(201).json({message: "Deporte creada exitosamente.",deporteData: data});
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

    // Ver todas las deportes
    static async fetchDeportes(req, res){
        try{
            await Deporte.findAll({
                attributes: ['nombre','indicador','id_subsede']
            })
                .then(result=>{
                    if(result.length == 0){
                        res.status(203).json({message: "Sin Deportes"});
                    }else{
                        res.status(201).json({message: true,deportes: result});
                    }
                })
        }catch (e) {
            res.send(500);
        }
    }

    // Update deporte
    static async updateDeporte(req, res){
        try{
            const {nombre, indicador, id_subsede} = req.body;

            let updateDeporte = {
                nombre: nombre,
                indicador: indicador,
                id_subsede: id_subsede
            }
            await Deporte.update(updateDeporte,{
                where: {
                    id: req.params.id
                }
            })
                .then(response=>{
                    res.status(200).json({success:true, message: "Deporte actualizada exitosamente."})
                })
                .then(err=>res.json({error: err}));

        }catch (e) {
            res.sendStatus(500);
        }
    }

    // Delete deporte
    static async deleteDeporte(req, res){
        try{
            let id = req.params.id;

            await Deporte.findAll({
                where: {id: id}
            })
                .then(result=>{
                    if(result.length == 1){
                        Deporte.destroy({
                            where:{id: id}
                        })
                            .then(deleted => {
                                res.status(200).json({success: true, message: "Deporte eliminado exitosamente"});
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
module.exports = DeporteController;