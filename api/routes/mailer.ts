import type { VercelRequest, VercelResponse } from '@vercel/node';
import { MailRequest, MailResponse } from '../models/mail';
import mailjet from 'node-mailjet';
import { checkOrigin } from '../middleware';
import 'dotenv/config';

export default async (req: VercelRequest, res: VercelResponse) => {
  if (!checkOrigin(req)) {
    const response: MailResponse = {
      success: false,
      message: 'Forbidden',
    };
    return res.status(403).json(response);
  }

  if (req.method === 'OPTIONS') {
    return res.status(200).send('ok');
  }

  const { name, email, message } = req.body as MailRequest;

  const mailer = mailjet.apiConnect(
    process.env.MAILJET_USERNAME!,
    process.env.MAILJET_PASS!
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
          email,
          text: message,
        },
        Subject: 'New message from Website',
        TemplateID: parseInt(process.env.YHM_TEMPLATE!),
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
        TemplateID: parseInt(process.env.SENDER_TEMPLATE!),
        TemplateLanguage: true,
      },
    ],
  };

  try {
    const newResp = await mailer
      .post('send', { version: 'v3.1' })
      .request(body);

    const responseBody = newResp.body as { Messages: { Status: string }[] };
    const success = responseBody.Messages[0].Status === 'success';

    const response: MailResponse = success
      ? {
          success: true,
          message: "Message sent! I'm on it, expect a speedy response.",
        }
      : {
          success: false,
          message: 'An unexpected anomaly interrupted the transmission.',
        };

    return res.status(success ? 200 : 503).json(response);
  } catch (err) {
    console.error(err);
    const response: MailResponse = {
      success: false,
      message: 'An unexpected anomaly interrupted the transmission.',
    };
    return res.status(500).json(response);
  }
};