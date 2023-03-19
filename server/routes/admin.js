const express  = require('express')
const adminRouter = express.Router();
const admin = require("../middlewares/admin")

//Add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
        const {name, description, image, quantity, price, category} = req.body;
        let product = new Product ({
            name,
            description,
            images,
            quantity,
            price,
            category,
        });
        product =  await product.save();
        res.json(product);
    } catch (e) {
        es.status(500).json({error. e.message });
    }
})
