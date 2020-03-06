/*
/ ------------------------------------
/ Subsedes Controller
/ ------------------------------------
/ CRUD de Subsede
*/
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const Subsede = require('../middlewares/models/').Subsede;

require('dotenv').config();
var secret = process.env.SECRET;

class SubsedeController{

    // Create subsede
    static async createSubsede(req, res){
        try{
            const {tipo,id_complejo} = req.body;
            let createNewSubsede = {
                tipo: tipo,
                id_complejo: id_complejo
                }
            Subsede.create(createNewSubsede)
                .then(data=>{
                    res.status(201).json({message: "Subsede creada exitosamente.",subsedeData: data});
                })
                .catch(err=> res.json({error: err}));

        }catch (e) {
            res.send(500);
        }
    }

    // Ver todas las subsedes
    static async fetchSubsedes(req, res){
        try{
            await Subsede.findAll({
                attributes: ['id','tipo','id_complejo','id_unico','id_poli']
            })
                .then(result=>{
                    if(result.length == 0){
                        res.status(203).json({message: "Sin Subsedes"});
                    }else{
                        res.status(201).json({message: true,subsedes: result});
                    }
                })
        }catch (e) {
            res.send(500);
        }
    }

    // Update subsede
    static async updateSubsede(req, res){
        try{
            const {tipo, id_complejo} = req.body;

            let updateSubsede = {
                tipo: tipo,
                id_complejo: id_complejo
            }
            await Subsede.update(updateSubsede,{
                where: {
                    id: req.params.id
                }
            })
                .then(response=>{
                    res.status(200).json({success:true, message: "Subsede actualizada exitosamente."})
                })
                .then(err=>res.json({error: err}));

        }catch (e) {
            res.sendStatus(500);
        }
    }

    // Delete subsede
    static async deleteSubsede(req, res){
        try{
            let id = req.params.id;

            await Subsede.findAll({
                where: {id: id}
            })
                .then(result=>{
                    if(result.length == 1){
                        Subsede.destroy({
                            where:{id: id}
                        })
                            .then(deleted => {
                                res.status(200).json({success: true, message: "Subsede eliminado exitosamente"});
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
module.exports = SubsedeController;