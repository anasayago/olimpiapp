'use strict';
module.exports = (sequelize, DataTypes) => {
  const Complejos = sequelize.define('Complejos', {
    nombre: DataTypes.STRING,
    localizacion: DataTypes.STRING,
    jefe: DataTypes.STRING,
    superficie: DataTypes.FLOAT,
    id_sede: DataTypes.INTEGER
  }, {});
  Complejos.associate = function(models) {
    Complejos.belongsTo(models.Sedes,{
      foreignKey: 'id_sede'
    })
    Complejos.hasMany(models.Subsede,{
      foreignKey: 'id_complejo',
      onDelete: 'CASCADE'
    })
  };
  return Complejos;
};