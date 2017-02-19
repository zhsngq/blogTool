#！ /bin/bash
echo 'tool add' &&
git add . &&
echo 'tool commit' &&
git commit -m "edit" &&
echo 'tool push' &&
git push &&
echo 'hexo' &&
hexo g &&
echo 'cd public' &&
cd public &&
echo 'add' &&
git add . &&
echo 'commit' &&
git commit -m "edit" &&
echo 'push' &&
git push &&
echo "OK"
