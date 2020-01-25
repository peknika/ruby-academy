# README

## Настройка окружения для ruby on rails приложения в ubuntu 18.04

Устанавлиеваем систему контроля версий, минимальный набор библиотек необходимый для установки зависимостей и curl

```bash
sudo apt-get update
sudo apt-get install git zsh build-essential curl wget htop libssl-dev libreadline-dev zlib1g-dev
```

Устанавливаем ohmyzsh - терминал для людей
```bash
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Устанавливаем rbenv - менеджер версий ruby
```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

cd ~/.rbenv && src/configure && make -C src

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'eval "$(rbenv init -)"' >> ~/.zshrc
```

И открываем новое окно терминала

### Устанавливаем MRI/CRuby 2.6.5
```bash
rbenv install 2.6.5
rbenv rehash
rbenv global 2.6.5
# в новом окне терминала
gem install bundler
```

### Устанавливаем необходимые зависимости и утилиты

```bash
sudo apt-get install autoconf bison build-essential libssl-dev \
libyaml-dev libreadline-dev  libmysqlclient-dev  \
postgresql-contrib zlib1g-dev libncurses5-dev libffi-dev libgdbm-dev \
libmagickwand-dev -y
```

### docker и docker-compose
- https://docs.docker.com/get-started/
- https://docs.docker.com/compose/gettingstarted/
- https://docs.docker.com/install/linux/docker-ce/ubuntu/

```bash
sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates \
  gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose


```

Управляем сервисом
```
sudo service docker start
sudo service docker status
sudo service docker stop
```

Поднимаем окружение
```bash
# помощь
docker-compose -h
# стартуем контейнер в первый раз
docker-compose up -d
# стартуем контейнер
docker-compose start
# останавливаем контейнер
docker-compose stop
```

### Генерируем ssh ключ
```
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

### Добавляем ключ в репозиторий для авторизации
```bash
cat ~/.ssh/id_rsa.pub
```
На выходе получите что-то вроде
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC5nlKuifj8Xg3IDdx5WpaMsHoHdK6MXtaX3afN7+5d32FgLIJPQSDaWaxvzweG3j781gChLnnRf7rsXJtpOFY6c60ZJfBc3IVJgECbifdia+EBQLD/tFtc4Kb55My2wX19vQtR922NYidm8V1+/8ffMIGTDs4n9//piJEoj8HozhQwsmkp+g1RIOp54zcD3VxXnYQ/HKtY+h4aL9CJ6/UpTlyt1BRQRaQgY5NrWATuBqs3DLrgfbrvQkxSkb86QS6iylcQkhKlW23XG1v/1I4JT+W/P/UPtwr9D529uhiIHR859acDke++ukJJqTTRcgPcrHaXK+5r7hSHbUeqGov7CTw7U1r+cdkvYGlmwCuir9O1TUYnLfTIlrT/rAr0Nrkr0/0B0ysUsAy2yYQauoQedfMwEOmpHmUW14SHUgZumji5bjjAHHCn1OpN68cHLxCC1wAKiWQ6rsCZEym8eXyyfbdapH4m67ivRgg3HKZKbBu10HNhByy5nxbd4MtjZRhQ== xxxx@xxxx.com
```
Публичный ключ нужно добавить в настройках профиля репозиторий bitbucket/github

Проверить что все вышло можно так
```
ssh -T git@bitbucket.com
```

