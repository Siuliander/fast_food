const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');
const cors = require('cors');

const app = express();

app.use(bodyParser.urlencoded({ extended: false}));
//app.use(bodyParser.json());
app.use( express.json());
// app.use(cors);


app.listen(3000, () => console.log('Rodando na porta 3000'));

app.get( '/' , (req,res)=>{
    res.send('OK')
});

require('./src/app/controllers/index')(app);
// require('./src/app/controllers/authController')(app);
// require('./src/app/controllers/projectController')(app);

