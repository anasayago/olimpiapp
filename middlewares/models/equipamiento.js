'use strict';
module.exports = (sequelize, DataTypes) => {
  const Equipamiento = sequelize.define('Equipamiento', {
    nombre: DataTypes.STRING,
    cantidad: DataTypes.INTEGER,
    id_deporte: DataTypes.INTEGER
  }, {});
  Equipamiento.associate = function(models) {
    Equipamiento.belongsTo(models.Deporte,{
      foreignKey: 'id_deporte'
    })
    Equipamiento.hasMany(models.Equipoevento,{
      foreignKey: 'id_equipo'
    })
   
  };
  return Equipamiento;
};