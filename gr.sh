#！ /bin/bash
echo 'tool pull ..' &&
git pull &&
if git diff
then
    echo 'tool add ..' &&
    git add . &&
    echo 'tool commit ..' &&
    git commit -m "edit" &&
    echo 'tool push ..' &&
    git push
else
    echo 'no diff file'
fi
echo 'hexo g ..' &&
hexo g &&
echo 'cd public' &&
cd public &&
if git diff
then
    echo 'add ..' &&
    git add . &&
    echo 'commit ..' &&
    git commit -m "edit" &&
    echo 'push ..' &&
    git push
else
    echo 'no diff file'
fi
echo "OK"
cd ../
