'use strict';
module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addConstraint('Subsedes', ['id_complejo'], {
      type: 'foreign key',
      name: 'complejo_subsede_fk',
      references: { 
        table: 'Complejos',
        field: 'id'
      }
    });
  },
  down: (queryInterface, Sequelize) => {
    return queryInterface. removeConstraint('Subsedes', 'complejo_subsede_fk');
  }
};
