import type { VercelRequest } from '@vercel/node';

export function checkOrigin(req: VercelRequest): boolean {
  const allowedOrigin = 'https://yashashm.dev';
  const origin = req.headers.origin;
  return origin === allowedOrigin;
}