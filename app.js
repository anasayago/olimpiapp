const express = require('express');  // setup express application
const bcrypt = require('bcryptjs');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const app = express();

app.use(cors());

// Parse incoming requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use(helmet());

// app.get('*', (req, res) => res.status(200).send({
//      message: 'Api por defecto',
//    }));

let api = require('./routes/api');
app.use('/api', api);
    
// set port
const port = process.env.PORT || 5200;

// start server
app.listen(port, function(){
    console.log(`Inicio de servidor en puerto ${port}...`);
});
