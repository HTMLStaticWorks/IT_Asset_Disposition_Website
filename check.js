const fs = require('fs');
const path = require('path');
const htmlFiles = fs.readdirSync('.').filter(f => f.endsWith('.html'));

htmlFiles.forEach(file => {
    const content = fs.readFileSync(file, 'utf8');
    const navMatch = content.match(/<nav class="navbar">([\s\S]*?)<\/nav>/);
    const footerMatch = content.match(/<footer class="footer">([\s\S]*?)<\/footer>/);
    
    console.log(`\nFile: ${file}`);
    console.log(`Nav Length: ${navMatch ? navMatch[0].length : 'Not found'}`);
    console.log(`Footer Length: ${footerMatch ? footerMatch[0].length : 'Not found'}`);
});
