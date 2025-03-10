module.exports = (_, res) => {
    res.status = 200;
    res.send('Use /mail path to mail.');
    res.end();
}