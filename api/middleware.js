function check_origin(req) {
    const allowedOrigin = 'https://yashashm.dev';
    const origin = req.headers.origin;
    return (origin && origin === allowedOrigin);
}

module.exports = check_origin