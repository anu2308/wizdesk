const fs = require('fs');
const path = require('path');

// Path to the package.json file
const packageJsonPath = path.join(__dirname, 'wizdesk', 'package.json');

// Read the package.json file
fs.readFile(packageJsonPath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading file:', err);
        return;
    }

    try {
        // Parse the JSON data
        const packageJson = JSON.parse(data);

        // Update the version of "react-scripts"
        packageJson.dependencies['react-scripts'] = '^5.0.1';

        // Convert the JSON back to string
        const updatedPackageJson = JSON.stringify(packageJson, null, 2);

        // Write the updated package.json back to file
        fs.writeFile(packageJsonPath, updatedPackageJson, 'utf8', (err) => {
            if (err) {
                console.error('Error writing file:', err);
                return;
            }
            console.log('"react-scripts" version updated successfully!');
        });
    } catch (error) {
        console.error('Error parsing JSON:', error);
    }
});
