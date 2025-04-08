const check_origin = require("../middleware");
module.exports = (req, res) => {
    if (!check_origin(req)) {
        return res.status(403).json({message: 'Forbidden'});
    }

    res.status = 200;
    res.send('Bad Request');
    res.end();
}