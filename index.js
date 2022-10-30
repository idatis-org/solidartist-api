const express = require('express');
const cors = require('cors');

const userController = require('./api/user_controller');
const artController = require('./api/art_controller');
const globalController = require('./api/global_controller');


const app = express();

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
    res.json("Funciona bien")
})

app.use("/img", express.static('uploads'));
app.use("/imgArt", express.static('artUploads'));



app.use('/api/user', userController);
app.use('/api/art', artController);
app.use('/api/all', globalController);

const port = process.env.PORT || 3030;

app.listen(port, () => console.log(`Express en puerto ${port}!`))
