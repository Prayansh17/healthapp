const AppError = require("../utils/appError");
const conn = require("../services/db");
const yup = require('yup');

const PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,15}$/;
const phoneRegExp = /^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$/;



const registerUserSchema = yup
  .object({
    name: yup.string().trim().min(2).max(50),
    address: yup.string().required().min(10),
    email: yup.string().required().email(),
    phone: yup.string().optional().matches(phoneRegExp, 'Phone number not valid'),
    password: yup.string().matches(PASSWORD_REGEX, 'password must contain one upper character, one lower character and a number. Max length 15 and min length 8'),
  })
  .required();
  
exports.registerPatient = (req, res, next) => {
    if(!req.body) return next( new AppError("No form data", 404));
    const { body } = req;
    try {
      const data = registerUserSchema.validateSync(body, { abortEarly: false, stripUnknown: true });
    } catch (e) {
      return res.status(422).json({ errors: e.inner });
    };


    let phoneNumber = (req.body.phone==null)? null : req.body.phone;
    const values = [req.body.name, req.body.address, 
                    req.body.email, phoneNumber, req.body.password, req.file.filename];

    
    
    var sql = "INSERT INTO patient (Name1, address, email, phone, pass, image) VALUES(?);"
    
    conn.query(sql, [values], function(err, data, fields) {
            if (err) return next(new AppError(err, 500));
            res.status(201).json({
              status: "success",
              message: "patient registered!",
        })}
    );
}

exports.getAllPsychiatrists = (req, res, next) => {
    if (!req.params.id) {
        return next(new AppError("No hospital id found", 404));
      }

      var hospital_name = "";
      var patient_count = 0;
      var sql1 = "SELECT name1 from hospital WHERE hospital_id = ?"
      var sql2 = "SELECT SUM(patient_count) AS cnt FROM psychiatrist WHERE hospital_id = ?  GROUP BY hospital_id;"
      var sql3 = "SELECT id, name1, patient_count from psychiatrist where hospital_id = ?;"

      conn.query(sql1, [req.params.id], function(err, data, fields) {
            if(err) return next(new AppError(err, 500));
            hospital_name = data[0].name1;
        }
      )
      conn.query(sql2, [req.params.id], function(err, data, fields) {
            if(err) return next(new AppError(err, 500));
            patient_count = data[0].cnt;
        }
      )

      conn.query(sql3, [req.params.id], function(err, data, fields) {
            if(err) return next(new AppError(err, 500));
            res.status(200).json({
                'hospital_id' : req.params.id,
                'hospital_name' : hospital_name,
                'pyschiatrists_count' : data?.length,
                'patient_count' : patient_count,
                'Psychiatrists_details': data
            })
        }
      )
}