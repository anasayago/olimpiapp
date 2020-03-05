'use strict';
module.exports = (sequelize, DataTypes) => {
  const Subsede = sequelize.define('Subsede', {
    tipo: DataTypes.STRING,
    id_complejo: DataTypes.INTEGER,
    id_unico: DataTypes.INTEGER,
    id_poli: DataTypes.INTEGER
  }, {});
  Subsede.associate = function(models) {
     Subsede.belongsTo(models.Complejos,{
        foreignKey: 'id_complejo'
      })
      Subsede.belongsTo(models.Unico,{
        foreignKey: 'id_unico'
      })
      Subsede.belongsTo(models.Poli,{
        foreignKey: 'id_poli'
      })
     Subsede.hasMany(models.Deporte,{
        foreignKey: 'id_subsede'
      })
  };
  return Subsede;
};