// Simple health check endpoint
module.exports = function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  
  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  res.status(200).json({ 
    status: 'ok', 
    message: 'Audio converter API is running',
    timestamp: new Date().toISOString(),
    endpoints: {
      convert: '/api/convert (POST)',
      health: '/api/health (GET)'
    }
  });
}