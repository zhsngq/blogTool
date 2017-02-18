#！ /bin/bash
git add . &&
git commit -m "edit" &&
git push &&
cd public &&
git add . &&
git commit -m "edit" &&
git push &&
echo "OK"
