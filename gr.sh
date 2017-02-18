#！ /bin/bash
git add . &&
git commit -m "edit" &&
git push &&
hexo g &&
cd public &&
git add . &&
git commit -m "edit" &&
git push &&
echo "OK"
