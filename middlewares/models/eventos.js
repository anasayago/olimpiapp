'use strict';
module.exports = (sequelize, DataTypes) => {
  const Eventos = sequelize.define('Eventos', {
    nombre: DataTypes.STRING,
    inicio: DataTypes.DATE,
    fin: DataTypes.DATE,
    comisarios: DataTypes.INTEGER,
    participantes: DataTypes.INTEGER,
    id_deporte: DataTypes.INTEGER
  }, {});
  Eventos.associate = function(models) {
    Eventos.belongsTo(models.Deporte,{
      foreignKey: 'id_deporte'
    })
    Eventos.hasMany(models.Equipoevento,{
      foreignKey: 'id_evento'
    })
    Eventos.hasMany(models.Eventocomisario,{
      foreignKey: 'id_evento',
      onDelete: 'CASCADE'
    })
  };
  return Eventos;
};