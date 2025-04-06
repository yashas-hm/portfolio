const mailjet = require('node-mailjet');
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

    const mailer = mailjet.apiConnect(process.env.MAILJET_USERNAME, process.env.MAILJET_PASS);

    const body = {
        'Globals': {
            'From': {
                'Email': 'no-reply@yashashm.dev',
                'Name': 'Yashas H Majmudar',
            }
        },
        'Messages': [
            {
                'To': [
                    {
                        'Email': 'yashashm.dev@gmail.com',
                    }
                ],
                'Variables': {
                    'email': requestBody['email'],
                    'text': requestBody['message'],
                },
                'Subject': 'New message from Website',
                'TemplateID': parseInt(process.env.YHM_TEMPLATE),
                'TemplateLanguage': true,
            },
            {
                'To': [
                    {
                        'Email': requestBody['email'],
                    }
                ],
                'Subject': 'Thank you for reaching out!',
                'TemplateID': parseInt(process.env.SENDER_TEMPLATE),
                'TemplateLanguage': true,
            }
        ]
    };

    try {
        const newResp = await mailer
            .post("send", {'version': 'v3.1'})
            .request(body);

        const responseBody = newResp.body;

        const messageToMe = responseBody['Messages'][0]['Status'] === 'success';

        if (!messageToMe) {
            res.status = 503;
            res.send(JSON.stringify({
                success: false,
                message: 'Communication hiccup! Unexpected error encountered. Retry later, please!'
            }));
            res.end();
        } else {
            res.status = 200;
            res.send(JSON.stringify({
                success: true,
                message: 'Message sent! I\'m on it, expect a speedy response.'
            }));
            res.end();
        }
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