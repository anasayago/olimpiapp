'use strict';
module.exports = (sequelize, DataTypes) => {
  const Sedes = sequelize.define('Sedes', {
    nombre: DataTypes.STRING,
    complejos: DataTypes.INTEGER,
    presupuesto: DataTypes.DOUBLE
  }, {});
  Sedes.associate = function(models) {
    Sedes.hasMany(models.Complejos,{
      foreignKey: 'id_sede',
      onDelete: 'CASCADE'
    })
  };
  return Sedes;
};