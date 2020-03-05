'use strict';
module.exports = (sequelize, DataTypes) => {
  const Unico = sequelize.define('Unico', {
    datos: DataTypes.STRING
  }, {});
  Unico.associate = function(models) {
    Unico.hasOne(models.Subsede,{
      foreignKey: 'id_uni',
      onDelete: 'CASCADE'
    })
  };
  return Unico;
};