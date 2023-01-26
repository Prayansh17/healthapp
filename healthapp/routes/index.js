const express = require("express");
const controllers = require("../controllers");
const router = express.Router();
const multer = require('multer')
const path = require('path')

const storage = multer.diskStorage({
    destination: "./public/images",
    filename: function(req, file, callBack){
        callBack(null, `${file.fieldname}_${Date.now()}${path.extname(file.originalname)}`);
    }
});

const fileFilter = (req, file, callBack) => {
    if(file.mimetype === 'image/jpeg' || file.mimetype === 'image/jpg' || file.mimetype === 'image/png') {
        callBack(null, true);
    }
    else {
        callBack(new Error('Unsupported files'), false)
    }
};

const upload = multer({
    storage: storage,
    fileFilter : fileFilter
})

router.route("/registerPatient").post(upload.single('image'), controllers.registerPatient);
router.route("/getAllPsychiatrists/:id").get(controllers.getAllPsychiatrists)

module.exports = router;