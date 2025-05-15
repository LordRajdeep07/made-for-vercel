# Disease Outbreak Prediction System Thesis

This repository contains a thesis on a Disease Outbreak Prediction System that utilizes machine learning techniques to forecast potential disease outbreaks based on environmental factors and health data.

## Thesis Content

The complete thesis is available in the `thesis.md` file. It covers:

1. Introduction
2. Review of Literature
3. Model Specification
4. System Design and Implementation
5. Data Collection and Processing
6. Experimental Observations
7. Discussion
8. Conclusion
9. References

## Converting the Thesis to PDF

Since LaTeX is not installed on this system, here are several alternative ways to generate a PDF from the Markdown file:

### Option 1: Online Markdown to PDF Converters

You can use free online services to convert the Markdown file to PDF:

1. [Markdown to PDF](https://www.markdowntopdf.com/)
2. [MD to PDF](https://md2pdf.netlify.app/)
3. [Dillinger.io](https://dillinger.io/) - Online Markdown editor with PDF export

Steps:
- Copy the content of thesis.md
- Paste it into one of these online tools
- Download the generated PDF

### Option 2: Using Microsoft Word

1. Open Microsoft Word
2. Create a new document
3. Copy and paste the content from thesis.md
4. Format as needed
5. Save as PDF (File > Save As > Choose PDF from the dropdown)

### Option 3: Using Google Docs

1. Open [Google Docs](https://docs.google.com)
2. Create a new document
3. Copy and paste the content from thesis.md
4. Format as needed
5. Download as PDF (File > Download > PDF Document)

### Option 4: Installing a Local Converter

If you have admin access, you could install one of these tools:

- **Pandoc**: A universal document converter
  ```
  winget install pandoc
  ```
  Then convert using:
  ```
  pandoc thesis.md -o thesis.pdf
  ```

- **Node.js packages**:
  ```
  npm install -g markdown-pdf
  ```
  Then convert using:
  ```
  markdown-pdf thesis.md
  ```

## Note on Images

Since the Markdown file references images without providing them (e.g., "Figure 1"), you may want to:
1. Add appropriate images to the document when converting
2. Remove image references if you don't have the actual images

## Deploying to Vercel

This application is configured for deployment on Vercel. Follow these steps to deploy:

### Prerequisites

1. A [Vercel](https://vercel.com) account
2. [Vercel CLI](https://vercel.com/docs/cli) installed: `npm install -g vercel`
3. [Node.js](https://nodejs.org/) installed

### Deployment Steps

1. **Login to Vercel**:
   ```
   vercel login
   ```

2. **Configure Environment Variables**:
   - Copy `env.example` to a new file (this will only be used for local reference)
   - Set up the environment variables in the Vercel dashboard after deployment
   - Critical variables include:
     - `SECRET_KEY` - For Flask sessions
     - `OPENAI_API_KEY` - For AI assistant functionality

3. **Deploy to Vercel**:
   ```
   vercel
   ```
   
4. **Follow the Prompts**:
   - Confirm settings when prompted
   - Choose to link to an existing project or create a new one
   - Vercel will build and deploy your application

5. **Verify Deployment**:
   - Vercel will provide a URL to your deployed application
   - Test that all functionality works as expected

### Deployment Configuration

The deployment configuration is defined in `vercel.json`. The Python application is served via the adapter in the `vercel/app.py` file, which imports and uses the Flask server from the original application.

### Updating the Deployment

To deploy updates to your application:

```
vercel --prod
```

## Contact

For any questions or assistance with this application, please contact [your contact information]. 