const express = require('express')
const { sequelize, Category, ArtPiece, UserPiece, CategoryPiece, CollectionPiece, Collection } = require('../models/index')
const multer = require('multer');

const router = express.Router();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'artUploads')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + '-' + file.originalname)
    }
})

const upload = multer({ storage: storage }).array('files');

//GET ALL CATEGORIES
router.get('/categories/all', (req, res) => {
    Category.findAll()
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//GET ALL ART PIECES
router.get('/art_piece/all', (req, res) => {
    ArtPiece.findAll()
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//GET AN ART PIECE BY IT'S ID
router.get('/piece/:id', (req, res) => {
    const { id } = req.params;
    ArtPiece.findOne({ where: { id } })
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FINDS THE CREATOR AND THE CURRENT OWNER OF ALL PIECES
router.get('/users_pieces/all', (req, res) => {
    UserPiece.findAll()
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FINDS THE CREATOR AND THE CURRENT OWNER OF A PIECE
router.get('/users_pieces/:id', (req, res) => {
    const { id } = req.params;
    UserPiece.findOne({ where: { id_piece: id } })
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//GET GATEGORIES OF A PICE
router.get('/piece/category/:id', (req, res) => {
    const { id } = req.params;
    CategoryPiece.findAll({ where: { id_piece: id } })
        .then(resp => {
            let idCategories = resp.map((cat) => (cat.id_category));
            Category.findAll({ where: { id: idCategories } })
                .then(response => res.status(200).json({ ok: true, data: response }))
                .catch(err => res.status(400).json({ ok: false, data: err }))
        })

})

//GET COLLECTION OF A PIECE
router.get('/piece/collection/:id', (req, res) => {
    const { id } = req.params;
    console.log(id);
    Collection.findOne({ where: { id: id } })
        .then(resp => res.status(200).json({ ok: true, data: resp }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//CREATE A NEW ART PIECE
router.post('/new', async (req, res) => {
    upload(req, res, async function (err) {
        if (err instanceof multer.MulterError) {
            return res.status(500).json(err)
        } else if (err) {
            return res.status(500).json(err)
        }

        let piece;

        if (req.files) {
            piece = {
                content: req.files[0].filename,
                title: req.body.title,
                piece_type: req.body.piece_type,
                front_page: req.files[1] ? req.files[1].filename : null,
                description: req.body.description,
                sell_price: req.body.sell_price,
                id_collection: req.body.id_collection
            }
            // collection: req.body.collection ? req.body.collection : null
        } else {
            console.log("Algo falla: ", req.body)
            // res.status(400).json({ ok: false, data: "No se ha subido ninguna obra" })
        }

        let transaction;
        let userPiece;
        let catPiece;

        try {

            transaction = await sequelize.transaction();

            await ArtPiece.create(piece, { transaction })
                .then(resp => {
                    userPiece = {
                        id_creator: req.body.idUser,
                        id_current_owner: req.body.idUser,
                        id_piece: resp.dataValues.id
                    }

                    catPiece = {
                        id_category: req.body.category,
                        id_piece: resp.dataValues.id
                    }

                    // colPiece = {
                    //     id_collection: req.body.collection,
                    //     id_piece: resp.dataValues.id
                    // }
                })
                .catch(err => console.log(err))

            await UserPiece.create(userPiece, { transaction })

            await CategoryPiece.create(catPiece, { transaction })
            //ADD COLLECTION
            // await CollectionPiece.create(colPiece, { transaction })

            await transaction.commit();

            res.status(200).json({ ok: true, data: "Insertado correctamente" })

        } catch (error) {
            console.log(error)
            // Rollback transaction 
            if (transaction) await transaction.rollback();
            res.status(400).json({ ok: false, data: "Error al insertar, revisa los campos" })
        }
    })
})

module.exports = router;