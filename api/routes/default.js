const check_origin = require("../middleware");
module.exports = (_, res) => {
    if(!check_origin()){
        return res.status(403).json({ message: 'Forbidden' });
    }
    
    res.status = 200;
    res.send('Bad Request');
    res.end();
}