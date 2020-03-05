'use strict';
module.exports = (sequelize, DataTypes) => {
  const Deporte = sequelize.define('Deporte', {
    nombre: DataTypes.STRING,
    indicador: DataTypes.STRING,
    id_subsede: DataTypes.INTEGER
  }, {});
  Deporte.associate = function(models) {
    Deporte.belongsTo(models.Subsede,{
      foreignKey: 'id_subsede'
    })
    Deporte.hasMany(models.Eventos,{
      foreignKey: 'id_deporte',
      onDelete: 'CASCADE'
    })
  };
  return Deporte;
};