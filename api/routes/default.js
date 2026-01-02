module.exports = async (req, res) => {
  if (req.method === 'OPTIONS') {
    return res.status(200).send('ok');
  }

  return res.status(418).send("I'm a Teapot.");
};