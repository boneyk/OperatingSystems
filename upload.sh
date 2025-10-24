set -e
echo "Добавление изменений в репозиторий"

if [ ! -d .git ]; then
    echo "Локальный репозиторий отсутствует"
    exit 1
fi

git status
git add .

if [ -z "$1" ]; then
    COMMIT_MSG="Auto commit"
else
    COMMIT_MSG="$1"
fi

git commit -m "$COMMIT_MSG" || echo "Нет изменинй для коммита"

echo "Отправка изменений на гитхаб"

git push origin main

echo "Изменения успешно загружены"