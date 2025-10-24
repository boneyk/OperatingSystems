set -e

echo "Обновление исходников из Git"
if [ -d .git ]; then
    git pull origin main || echo "Репозиторий не синхронизирован с удаленным"
else
    echo "Git-репозиторий не инициализирован"
fi

echo "Сборка проекта"
mkdir -p build
cd build
cmake ..
make

echo "Запуск программы"
./hello