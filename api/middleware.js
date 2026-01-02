const ALLOWED_ORIGIN_PATTERN = /^https:\/\/([a-zA-Z0-9-]+\.){0,2}yashashm\.dev$/;

function getValidOrigin(req) {
  const origin = req.headers.origin;
  if (!origin) return null;
  return ALLOWED_ORIGIN_PATTERN.test(origin) ? origin : null;
}

module.exports = { getValidOrigin };