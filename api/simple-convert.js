const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');
const { promisify } = require('util');

const execAsync = promisify(exec);

export default async function handler(req, res) {
  // Enable CORS
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  try {
    console.log('🎵 Simple audio conversion request received');
    
    // Get the uploaded file data
    const contentType = req.headers['content-type'];
    if (!contentType || !contentType.includes('audio/')) {
      return res.status(400).json({ error: 'Invalid content type. Expected audio file.' });
    }

    // Read the raw body data
    const chunks = [];
    req.on('data', chunk => chunks.push(chunk));
    req.on('end', async () => {
      try {
        const buffer = Buffer.concat(chunks);
        
        if (buffer.length === 0) {
          return res.status(400).json({ error: 'No audio data received' });
        }

        console.log(`📁 Received audio file: ${buffer.length} bytes`);

        // Create temporary file paths
        const tempDir = '/tmp';
        const inputPath = path.join(tempDir, `input_${Date.now()}.m4a`);
        const outputPath = path.join(tempDir, `output_${Date.now()}.mp3`);

        // Write input file
        fs.writeFileSync(inputPath, buffer);
        console.log(`💾 Saved input file: ${inputPath}`);

        // Convert using system FFmpeg (simpler approach)
        const ffmpegCommand = `ffmpeg -y -i "${inputPath}" -vn -acodec libmp3lame -b:a 192k "${outputPath}"`;
        console.log('🎛️ FFmpeg command:', ffmpegCommand);
        
        try {
          const { stdout, stderr } = await execAsync(ffmpegCommand, { timeout: 30000 });
          console.log('✅ Conversion completed');
          if (stderr) console.log('FFmpeg stderr:', stderr);
        } catch (execError) {
          console.error('❌ FFmpeg execution error:', execError);
          throw new Error(`FFmpeg failed: ${execError.message}`);
        }

        // Read the converted file
        if (!fs.existsSync(outputPath)) {
          throw new Error('Output file was not created');
        }

        const outputBuffer = fs.readFileSync(outputPath);
        console.log(`📤 Sending MP3 file: ${outputBuffer.length} bytes`);

        // Clean up temporary files
        try {
          fs.unlinkSync(inputPath);
          fs.unlinkSync(outputPath);
          console.log('🗑️ Cleaned up temporary files');
        } catch (cleanupErr) {
          console.warn('⚠️ Cleanup warning:', cleanupErr.message);
        }

        // Send the MP3 file
        res.setHeader('Content-Type', 'audio/mpeg');
        res.setHeader('Content-Length', outputBuffer.length);
        res.setHeader('Content-Disposition', 'attachment; filename="converted.mp3"');
        res.status(200).send(outputBuffer);

      } catch (conversionError) {
        console.error('❌ Conversion error:', conversionError);
        res.status(500).json({ 
          error: 'Conversion failed', 
          details: conversionError.message 
        });
      }
    });

  } catch (error) {
    console.error('❌ Server error:', error);
    res.status(500).json({ 
      error: 'Internal server error', 
      details: error.message 
    });
  }
}