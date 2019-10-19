#!/usr/bin/env bash

#Create the app
create-react-app $1
cd "$1/src"

#Build the src dir structure
mkdir styles components tests images

#Edit the files
# App.js
sed -i.tmp s:./logo.svg:../images/logo.svg:g App.js
sed -i.tmp s:./App.css:../styles/App.css:g App.js

# App.test.js
sed -i.tmp s:./App:../components/App:g App.test.js

# index.js
sed -i.tmp s:./index.css:./styles/index.css:g index.js
sed -i.tmp s:./App:./components/App:g index.js

# Clean up tmp files used for writing
rm *.tmp

#Move the files
mv App.test.js tests
mv App.css index.css styles
mv App.js components
mv logo.svg images
