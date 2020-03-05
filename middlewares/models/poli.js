'use strict';
module.exports = (sequelize, DataTypes) => {
  const Poli = sequelize.define('Poli', {
    datos: DataTypes.STRING
  }, {});
  Poli.associate = function(models) {
    Poli.hasOne(models.Subsede,{
      foreignKey: 'id_poli',
      onDelete: 'CASCADE'
    })
  };
  return Poli;
};