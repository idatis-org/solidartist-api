const express = require('express')
const bcrypt = require('bcryptjs')
const jsonwebtoken = require('jsonwebtoken')
const Config = require('./Config')
const { User, UserPiece, ArtPiece, Collection, Complaint } = require('../models/index');

const multer = require('multer');
const { Error } = require('sequelize')

const { secretKey, expiredAfter } = Config;


const router = express.Router();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + '-' + file.originalname)
    }
})

const upload = multer({ storage: storage }).array('files');


//FIND ALL USERS
router.get('/', (req, res) => {
    User.findAll()
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND A USER BY ALIAS
router.get('/:alias', (req, res) => {
    const { alias } = req.params;
    User.findOne({ where: { alias } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND A USER BY ID
router.get('/find/:id', (req, res) => {
    const { id } = req.params;
    User.findOne({ where: { id } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FINDS THE ART PIECES OF AN ARTIST GIVEN AN ID
router.get('/art/creator/:id', (req, res) => {
    const { id } = req.params;
    UserPiece.findAll({ where: { id_creator: id } })
        .then(resp => {
            const idsPieces = resp.map(el => (el.id_piece))
            ArtPiece.findAll({ where: { id: idsPieces } })
                .then(resp => res.status(200).json({ ok: true, data: resp }))
                .catch(err => res.status(400).json({ ok: false, data: err }))
        })
})

//FINDS THE PIECES THAT BELONGS TO A GIVEN ID
router.get('/art/owner/:id', (req, res) => {
    const { id } = req.params;
    UserPiece.findAll({ where: { id_current_owner: id } })
        .then(resp => {
            const idsPieces = resp.map(el => (el.id_piece))
            ArtPiece.findAll({ where: { id: idsPieces } })
                .then(resp => res.status(200).json({ ok: true, data: resp }))
                .catch(err => res.status(400).json({ ok: false, data: err }))
        })
})

//CREATE COLLECTION
router.post('/createCollection', (req, res) => {
    console.log(req.body)
    Collection.create(req.body)
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//GET THE COLLECTIONs OF A GIVEN USER
router.get('/getCollections/:id', (req, res) => {
    const { id } = req.params;
    Collection.findAll({ where: { id_user: id } })
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))

})

//REPORT USER
router.post('/report', (req, res) => {
    console.log(req.body)
    Complaint.create(req.body)
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//EDIT USER
router.put('/edit', (req, res) => {
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            return res.status(500).json(err)
        } else if (err) {
            return res.status(500).json(err)
        }

        let usuario = {
            description: req.body.description,
            profile_type: req.body.profile_type,
        }
        //files[0] is the user profile photo and the files[1] is the wall profile photo
        if (req.files) {
            if (req.files[0]) {
                usuario.user_img = req.files[0].filename
            }
            if (req.files[1]) {
                usuario.profile_img = req.files[1].filename
            }
        }

        console.log(usuario)
        const { id } = req.body;

        User.findOne({ where: { id: id } })
            .then(user => user.update(usuario))
            .then(result => res.status(200).json({ ok: true, data: result }))
            .catch(err => res.status(400).json({ ok: false, data: err }))
    })
})


//REGISTER A USER
router.post('/register', function (req, res, next) {
    const hash = bcrypt.hashSync(req.body.password, 10);
    console.log(req.body.password)
    req.body.password = hash;
    User.create(req.body)
        .then(item => res.json({ ok: true, data: item }))
        .catch((error) => res.json({ ok: false, error }))
});

//LOGIN
router.post('/login', (req, res) => {
    const response = {};
    const { username, password } = req.body;
    console.log(username, password)
    let flag = false

    if (!username || !password) {

        return res.status(400).json({ ok: false, msg: "email or password not received" })
    }

    User.findOne({ where: { username } })
        .then((user) => {
            if (user && bcrypt.compareSync(password, user.password)) {
                if (user && !user.active) {
                    return user;
                } else {
                    flag = true
                    throw "Reported user";
                }
            } else {
                throw "username or password invalids";
            }
        }

            /*if (user && bcrypt.compareSync(password, user.password)) {
                return user;
            } else {
                throw "username or password invalids";
            }*/
        )
    .then(usuari => {
        response.token = jsonwebtoken.sign(
            {
                expiredAt: new Date().getTime() + expiredAfter,
                username: usuari.username,
                alias: usuari.alias,
                id: usuari.id,
                role: usuari.role
            },
            secretKey
        );
        response.ok = true;
        res.json(response)
    })
    // .catch(err => res.status(400).json({ ok: false, msg: err }))
    .catch(err => {
        if (flag) {
            msg = "Reported user, please contact us";
            sts = 403;
        } else {
            sts = 400;
        }

        res.status(sts).json({ ok: false, msg: err })
    })

});

module.exports = router;