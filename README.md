# Free Cloud Audio Converter

## 🚀 Deploy to Vercel (Free) - Easy Method

### Step 1: Setup Git Repository
```bash
# Navigate to the tmp_rovodev_cloud_server folder
cd tmp_rovodev_cloud_server

# Run the setup script
# On Windows:
git_setup.bat

# On Mac/Linux:
chmod +x git_setup.sh
./git_setup.sh
```

### Step 2: Push to GitHub
1. Create new repository on GitHub (e.g., `audio-converter-api`)
2. Copy the repository URL
3. Run these commands:
```bash
git remote add origin https://github.com/yourusername/audio-converter-api.git
git branch -M main
git push -u origin main
```

### Step 2: Deploy via Vercel Web Interface
1. Go to [vercel.com](https://vercel.com) and sign up
2. Click "New Project"
3. Import your GitHub repository
4. Vercel will auto-detect it's a Node.js project
5. Click "Deploy"

### Alternative: Direct Upload
1. Go to [vercel.com](https://vercel.com)
2. Drag and drop the `tmp_rovodev_cloud_server` folder
3. Vercel will deploy automatically

### Step 3: Get Your URL
After deployment, Vercel will give you a URL like:
`https://your-app-name.vercel.app`

### Step 4: Update Android App
In your Android app, update the API URL:

```python
# In app/src/main/python/cloud_audio_converter.py
# Change line 15:
self.api_url = "https://YOUR-VERCEL-URL.vercel.app/api/convert"
```

## 📊 Usage Limits (Free Tier)
- **Bandwidth:** 100GB/month
- **Function Duration:** 10 seconds (enough for small files)
- **File Size Limit:** ~50MB per file
- **Concurrent Requests:** 1000

## 🔧 API Usage
```bash
# Test your deployment
curl -X POST https://your-app.vercel.app/api/convert \
  -H "Content-Type: audio/mp4" \
  --data-binary @test.m4a \
  -o converted.mp3
```

## 🛠️ Alternative: Railway Deploy
If Vercel doesn't work, try Railway:

1. Create account at [railway.app](https://railway.app)
2. Connect GitHub repo
3. Deploy automatically
4. Get URL like: `https://your-app.railway.app`

## 📱 Android App Integration
Your app will now:
1. Download M4A from YouTube
2. Upload to your cloud converter
3. Download MP3 result
4. Save to device

**Conversion flow:**
Cloud Service → FFmpegKit → Java Audio → File Copy