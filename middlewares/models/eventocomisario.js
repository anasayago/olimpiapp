'use strict';
module.exports = (sequelize, DataTypes) => {
  const Eventocomisario = sequelize.define('Eventocomisario', {
    tipo: DataTypes.STRING,
    id_comisario: DataTypes.INTEGER,
    id_evento: DataTypes.INTEGER
  }, {});
  Eventocomisario.associate = function(models) {
    Eventocomisario.belongsTo(models.Eventos,{
      foreignKey: 'id_evento'
    })
    Eventocomisario.belongsTo(models.Comisario,{
      foreignKey: 'id_comisario'
    })
    
  };
  return Eventocomisario;
};