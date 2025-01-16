- ВНИМАНИЕ, предназначено для deb подобных систем (debian, ubuntu)
- рекомендуется на сервере актуализировать список репозиториев: https://github.com/Lojaleto/sources
- предварительно создаём мир в локальной игре как сервер, настраиваем карту, прописываем администраторов, устанавливаем пароль
- запускаем и сразу выходим
- далее на выделеном сервере:
```bash
apt install wget lynx screen git
git clone https://github.com/Lojaleto/factorio-2-dedicated-server.git
cd ./factorio-2-dedicated-server

chmod +x ./install.sh ./start.sh ./stop.sh ./upgrade.sh
./install.sh
```
<br>
Настройка
- отредактируем файл указав администраторов сервера /home/factorio/factorioServer/server-adminlist.json  (или загрузите свой)
- - забираем из папки C:\Users\[ваш пользователь]\AppData\Roaming\Factorio  файл server-adminlist.json

- загрузим файл server-settings.json в /home/factorio/factorioServer/ (если хотим сохранить пароль и прочие настройки сервера)
- - забираем из папки C:\Program Files (x86)\Steam\steamapps\common\Factorio\data  файл server-settings.json (возможно у вас расположение отличается)

- забираем из папки C:\Users\[ваш пользователь]\AppData\Roaming\Factorio\saves  файл с нужным сейвом и кладём в /home/factorio/factorioServer/saves/

- не забываем менять права на файл сохранения и на конфиги после загрузи их на сервер:
```bash
chown -R factorio:factorio /home/factorio/factorioServer
```

- всё! можно запускать:
```bash
systemctl start factorio
```
<br>
Донастройка
- в cron хорошо бы добавить systemctl reload factorio, для обновления игры так:
```bash
crontab -e
```
- в конце добавить строку:
0 6,18 * * * systemctl reload factorio
- и оставить пустую строку после, иначе cron будет ругаться

- выше cron назначен на 6 и 18 часов, в этот момент для обновления сервер будет приостанавливаться ~ на пол минуты
- - первые два значения: 0 - минуты; 6,18 - часы. можно поменять или добавить часы

- либо можно запускать эту команду в ручную по необходимости:
```bash
systemctl reload factorio
```
<br>
Работа с ошибками
- к сессии screen можно подключиться для просмотра лога так:
```bash
screen -x factorio/factorio
```
- выйти из сессии: ctr+A  ctr+D

- либо можно для просмотра лога запутить сервер вручную под пользователем factorio:
```bash
su factorio
/bin/bash -c "/home/factorio/factorioServer/bin/x64/factorio --start-server-load-latest"
```
- остановить: ctr+C
- выйти из сеанса пользователя factorio: ctr+D
