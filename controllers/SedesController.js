/*
/ ------------------------------------
/ Sedes Controller
/ ------------------------------------
/ CRUD de Sedes
*/
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Sede = require('../middlewares/models/').Sedes;

require('dotenv').config();
var secret = process.env.SECRET;

class SedeController{

    // Create sede
    static async createSede(req, res){
        try{
            const {nombre,complejos,presupuesto} = req.body;
            await Sede.findAll({
                where: {nombre: nombre}
            })
                .then(result=>{
                    if(result.length > 0){
                        res.status(203).json({message: "Sede ya se encuentra registrada."});
                    }else{
                        let createNewSede = {
                            nombre: nombre,
                            complejos: complejos,
                            presupuesto: presupuesto
                        }
                        Sede.create(createNewSede)
                            .then(data=>{
                                res.status(201).json({message: "Sede creada exitosamente.",sedeData: data});
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

    // Ver todas las sedes
    static async fetchSedes(req, res){
        try{
            await Sede.findAll({
                attributes: ['nombre','complejos','presupuesto']
            })
                .then(result=>{
                    if(result.length == 0){
                        res.status(203).json({message: "Sin Sedes"});
                    }else{
                        res.status(201).json({message: true, sedes: result});
                    }
                })
        }catch (e) {
            res.send(500);
        }
    }

    // Update sede
    static async updateSede(req, res){
        try{
            const {nombre, complejos, presupuesto} = req.body;

            let updateSede = {
                nombre: nombre,
                complejos: complejos,
                presupuesto: presupuesto
            }
            await Sede.update(updateSede,{
                where: {
                    id: req.params.id
                }
            })
                .then(response=>{
                    res.status(200).json({success:true, message: "Sede actualizada exitosamente."})
                })
                .then(err=>res.json({error: err}));

        }catch (e) {
            res.sendStatus(500);
        }
    }

    // Delete sede
    static async deleteSede(req, res){
        try{
            let id = req.params.id;

            await Sede.findAll({
                where: {id: id}
            })
                .then(result=>{
                    if(result.length == 1){
                        Sede.destroy({
                            where:{id: id}
                        })
                            .then(deleted => {
                                res.status(200).json({success: true, message: "Sede eliminada exitosamente"});
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
module.exports = SedeController;