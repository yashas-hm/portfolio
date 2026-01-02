const mailjet = require('node-mailjet');
const { getValidOrigin } = require('../middleware');
const { successResponse, errorResponse } = require('../models/mail');
require('dotenv/config');

module.exports = async (req, res) => {
  const origin = getValidOrigin(req);

  if (!origin) {
    return res.status(403).json(errorResponse('Forbidden'));
  }

  res.setHeader('Access-Control-Allow-Origin', origin);
  res.setHeader('Access-Control-Allow-Credentials', 'true');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).send('ok');
  }

  const { name, email, message } = req.body;

  const mailer = mailjet.apiConnect(
    process.env.MAILJET_USERNAME,
    process.env.MAILJET_PASS
  );

  const body = {
    Globals: {
      From: {
        Email: 'no-reply@yashashm.dev',
        Name: 'Yashas H Majmudar',
      },
    },
    Messages: [
      {
        To: [
          {
            Email: 'yashashm.dev@gmail.com',
            Name: 'Yashas H Majmudar',
          },
        ],
        Variables: {
          email: email,
          message: message,
          name: name ?? 'Not Provided',
        },
        Subject: 'New message from Portfolio',
        TemplateID: parseInt(process.env.YHM_TEMPLATE),
        TemplateLanguage: true,
      },
      {
        To: [
          {
            Email: email,
            Name: name ?? '',
          },
        ],
        Subject: 'Thank you for reaching out!',
        TemplateID: parseInt(process.env.SENDER_TEMPLATE),
        TemplateLanguage: true,
      },
    ],
  };

  try {
    const newResp = await mailer
      .post('send', { version: 'v3.1' })
      .request(body);

    const responseBody = newResp.body;
    const success = responseBody.Messages[0].Status === 'success';

    const response = success
      ? successResponse("Message sent! I'm on it, expect a speedy response.")
      : errorResponse('An unexpected anomaly interrupted the transmission.');

    return res.status(success ? 200 : 503).json(response);
  } catch (err) {
    console.error(err);
    return res.status(500).json(
      errorResponse('An unexpected anomaly interrupted the transmission.')
    );
  }
};