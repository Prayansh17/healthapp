const express = require("express");
const router = require("./routes");
const AppError = require("./utils/appError");
const errorHandler = require("./utils/errorHandler");
const app = express();
app.use(express.json());

app.use('/',router);

app.all("*", (req, res, next) => {
 next(new AppError(`The URL ${req.originalUrl} does not exists`, 404));
});
app.use(errorHandler);


const PORT = 8000;
app.listen(PORT, () => {
 console.log(`server running on port ${PORT}`);
});

module.exports = app;