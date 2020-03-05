'use strict';
module.exports = (sequelize, DataTypes) => {
  const Comisario = sequelize.define('Comisario', {
    nombre: DataTypes.STRING
  }, {});
  Comisario.associate = function(models) {
    Comisario.hasMany(models.Eventocomisario,{
      foreignKey: 'id_comisario',
      onDelete: 'CASCADE'
    })
  };
  return Comisario;
};