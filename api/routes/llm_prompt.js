const check_origin = require("../middleware");
require('dotenv').config({path: `${__dirname}/../.env`});

module.exports = async (req, res) => {
    if(!check_origin()){
        return res.status(403).json({ message: 'Forbidden' });
    }
    
    if (req.method === 'OPTIONS') {
        res.status = 200;
        res.send('ok');
        res.end();
        return;
    }

    const requestBody = req.body;
    
    try {
        
    } catch (err) {
        console.log(err);
        res.status = 200;
        res.send(JSON.stringify({
            success: false,
            message: 'Communication hiccup! Unexpected error encountered. Retry later, please!'
        }));
        res.end();
    }
}