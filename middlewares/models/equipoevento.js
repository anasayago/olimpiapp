'use strict';
module.exports = (sequelize, DataTypes) => {
  const Equipoevento = sequelize.define('Equipoevento', {
    cantidad: DataTypes.INTEGER,
    id_evento: DataTypes.INTEGER,
    id_equipo: DataTypes.INTEGER
  }, {});
  Equipoevento.associate = function(models) {
    Equipoevento.belongsTo(models.Equipamiento,{
      foreignKey: 'id_equipo'
    })
    Equipoevento.belongsTo(models.Eventos,{
      foreignKey: 'id_evento'
    })
  };
  return Equipoevento;
};